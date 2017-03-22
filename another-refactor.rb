class Image 
  def initialize(image_data)
    @image_data = image_data
    @copy = Marshal.load(Marshal.dump(@image_data))
  end

  def reset_image
    @image_data = Marshal.load(Marshal.dump(@copy))
  end

  def temp_data
    temp = Marshal.load(Marshal.dump(@image_data))
    return temp
  end
  

  def get_ones(temp)
    coords = []
    temp.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        coords << [row_index, col_index] if col == 1
      end
    end
    return coords
  end
  
  def blur_image(temp)
    
    coords = self.get_ones(temp)
    coords.each do |row, col|
      temp[row][col - 1] = 1 if col != 0
      temp[row][col + 1] = 1 if col != temp[0].length - 1
      temp[row - 1][col] = 1 if row != 0
      temp[row + 1][col] = 1 if row != temp.length - 1
    end
    return temp
  end

  def manhattan_blur(num)
    temp = self.temp_data
    temp1 = nil
    num.times do 
      temp1 = self.blur_image(temp)
    end
    return temp1
  end

  def output_image
    @image_data.each { |arr| puts arr.join(" ") }
    puts "\n"
  end

  def output_copy
    @copy.each { |arr| puts arr.join }
    puts "\n"
  end

  def output_original_and_blurred_image(amt)
    self.output_image
    puts "Blurred Image:"
    blurred_image_data = self.manhattan_blur(amt)
    p blurred_image_data
    blurred_image = self.class.new(blurred_image_data)
    blurred_image.output_image
    puts "------------"
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

# puts "Original 1px Transform Image:"
# one_px_transform.output_original_and_blurred_image

# puts "Original 2px Transform Image:"
# two_px_transform.output_original_and_blurred_image

# puts "Original Edge Pixels Image:"
# px_edge_transform.output_original_and_blurred_image

# puts "Original 2px Transform Image:"
# two_px_transform.output_original_and_blurred_image(2)
# puts "Result of Original"
# two_px_transform.output_copy
# puts "1px Transform Image:"
# two_px_transform.output_original_and_blurred_image(1)
puts "3px Transform Image:"
two_px_transform.output_original_and_blurred_image(3)
puts "1px Transform Image:"
two_px_transform.output_original_and_blurred_image(1)
# puts "0px Transform Image:"
# two_px_transform.output_original_and_blurred_image(0)