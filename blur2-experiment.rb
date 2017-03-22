class Image 
  attr_accessor :image_data
  def initialize(image_data)
    @image_data = image_data
  end

  def get_ones
    copy = Marshal.load(Marshal.dump(@image_data))
    coords = []
    copy.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        coords << [row_index, col_index] if col == 1
      end
    end
    return coords
  end

  def pairs(n)
    pairs = []

    (n + 1).times do |x|
      (n + 1).times do |y|
        if x + y <= n && x + y > 0
          pairs << [x, y]
          pairs << [-x, y]
          pairs << [x, -y]
          pairs << [-x, -y]
          #do something
        end
      end
    end
    return pairs
  end

  def manhattan_blur(num)
    copy = Marshal.load(Marshal.dump(image_data))
    pairs = self.pairs(num)
    coords = self.get_ones
    target_pixels = []

    coords.each do |row, col|
      pairs.each do |pairs_row, pairs_col|
        # if col != 0 || col != copy[0].length - 1 || row != 0 || row != copy.length - 1
        #   copy[row + pairs_row][col + pairs_col] = 1
        # end
        if (row + pairs_row >= 0) && (row + pairs_row <= copy.length - 1) && (col + pairs_col >= 0) && (col + pairs_col <= copy[0].length - 1)
          target_pixels << [row + pairs_row, col + pairs_col]
        end
      end
    end

    target_pixels.each do |row, col|
    #  p "#{row} , #{col}"
      copy[row][col] = 1
    end

    return copy
  end
  

  
  def blur_image(amount)
    copy = Marshal.load(Marshal.dump(image_data))
    amount.times do |n|
      coords = self.get_ones
      coords.each do |row, col|
        pairs.each do |pairs_row, pairs_col|
          copy[row][col - 1] = 1 if col != 0
          copy[row][col + 1] = 1 if col != copy[0].length - 1
          copy[row - 1][col] = 1 if row != 0
          copy[row + 1][col] = 1 if row != copy.length - 1
        end
      end
      puts "Copy number #{n}"
      p copy
    end
    return copy
  end

  # def manhattan_blur(num)
  #   self.build_copy
  #   num.times do 
  #     self.get_ones
  #     self.blur_image
  #   end
  # end

  def output_original_image
    @image_data.each { |arr| puts arr.join }
    puts "\n"
  end

  def output_original_and_blurred_image(num)
    self.output_original_image
    puts "Blurred Image:"
    self.blur_image
    puts "------------"
  end

  def output_test(amt)
    self.output_original_image
    puts "Blurred Image:"
    copy = self.blur_image(amt)
    # copy.each { |arr| puts arr.join }
    # puts "---"
    # self.output_original_image
  end
  

end

# Make this cases work
one_px_transform = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

two_px_transform = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

px_edge_transform = Image.new([
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 1]
])

test = Image.new([
  [0]
])

puts "@image_data"
px_edge_transform.output_original_image
puts "Build manhattan pairs"
p px_edge_transform.pairs(3)
puts "Ones Location"
px_edge_transform.get_ones.each {|arr| puts arr.join(" ") }

px_edge_transform.manhattan_blur(3).each {|arr| puts arr.join(" ") }
puts "---"

px_edge_transform.manhattan_blur(1).each {|arr| puts arr.join(" ") }

