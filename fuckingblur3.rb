class Image 
  def initialize(image_data)
    @image_data = image_data
    @image_copy = Marshal.load(Marshal.dump(@image_data))
  end

  def output_original_image
    @image_data.each { |arr| puts arr.join }
    puts "\n"
  end

 
  

  def get_ones
    coords = []
    @image_copy.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        coords << [row_index, col_index] if col == 1
      end
    end
    return coords
  end

  def blur_image
    coords = self.get_ones
    coords.each do |row, col|
      @image_copy[row][col - 1] = 1 if col != 0
      @image_copy[row][col + 1] = 1 if col != @image_copy[0].length - 1
      @image_copy[row - 1][col] = 1 if row != 0
      @image_copy[row + 1][col] = 1 if row != @image_copy.length - 1
    end
  end

  def output_blur
    self.blur_image
    @image_copy.each {|arr| puts arr.join }
  end

  def manhattan_blur(num)
    num.times do 
      self.get_ones
      self.blur_image
    end
  end

  def output_manhattan_blur(num)
    self.manhattan_blur(num)
    @image_copy.each {|arr| puts arr.join }
  end

end

test = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
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

puts "Original Image"
test.output_original_image

puts "Get Ones Array"
p test.get_ones

puts "Blurred Image"
test.output_blur

# puts "Build Copy"
# test.build_copy

puts "Manhattan Blur"
test.output_manhattan_blur(3)
puts "---"
px_edge_transform.output_manhattan_blur(2)
puts "---"
px_edge_transform.output_manhattan_blur(1)

puts "Re-Output Original Image"
test.output_original_image