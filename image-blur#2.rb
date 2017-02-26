class Image 
  def initialize(image_data)
    @image_data = image_data
    
  end

  def get_ones
    @coords = []
    @image_data.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        @coords << [row_index, col_index] if col == 1
      end
    end
  end
  
  def blur_image
    @coords.each do |row, col|
      @image_data[row][col-1] = 1 if col != 0
      @image_data[row][col+1] = 1 if col != @image_data[0].length - 1
      @image_data[row - 1][col] = 1 if row != 0
      @image_data[row + 1][col] = 1 if row != @image_data.length - 1
    end
  end

  def output_image
    @image_data.each { |arr| puts arr.join }
    puts "\n"
  end

  def output_original_and_blurred_image
    self.output_image
    self.get_ones
    self.blur_image
    puts "Blurred Image:"
    self.output_image

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
  [0, 0, 0, 0],
  [0, 0, 0, 1],
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 1, 0]
])

puts "Original 1px Transform Image:"
one_px_transform.output_original_and_blurred_image

puts "Original 2px Transform Image:"
two_px_transform.output_original_and_blurred_image

puts "Original Edge Pixels Image:"
px_edge_transform.output_original_and_blurred_image