class Image 
  def initialize(image_data)
    @image_data = image_data
    freeze
  end

  def build_copy
    @complex_copy = Marshal.load(Marshal.dump(@image_data))
    puts @complex_copy.each { |arr| puts arr.join }
    puts "\n"
  end

  def get_ones
    coords = []
    @image_data.map.with_index do |row, row_index|
      row.map.with_index do |col, col_index|
        coords << [row_index, col_index] if col == 1
      end
    end
    return coords
  end
  
  def blur_image
    coords = self.get_ones
    complex_copy = self.build_copy
    coords.collect do |row, col|
      complex_copy[row][col - 1] = 1 if col != 0
      complex_copy[row][col + 1] = 1 if col != complex_copy[0].length - 1
      complex_copy[row - 1][col] = 1 if row != 0
      complex_copy[row + 1][col] = 1 if row != complex_copy.length - 1
    end
  end

   def manhattan_blur(num)
    num.times do 
      self.get_ones
      self.blur_image
    end
  end

  def output_image
    @image_data.each { |arr| puts arr.join }
    puts "\n"
  end

  def output_manhattan_image(blur_amount)
    self.output_image
    puts "Manhattan Blurred Image:"
    self.build_copy
    self.manhattan_blur(blur_amount)
    self.output_image
  end

end

# Make these cases work
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

# puts "Original Edge Pixels Image:"
# one_px_transform.output_manhattan_image(2)

# puts "Again:"
# one_px_transform.output_manhattan_image(1)

one_px_transform.build_copy