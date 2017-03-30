class Image 
  def initialize(image_data)
    @image_data = image_data
  end  

  def get_ones(copy)
    coords = []
    copy.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        coords << [row_index, col_index] if col == 1
      end
    end
    return coords
  end
  
  def blur_image(copy)
    coords = self.get_ones(copy)
    coords.each do |row, col|
      copy[row][col - 1] = 1 if col != 0
      copy[row][col + 1] = 1 if col != copy[0].length - 1
      copy[row - 1][col] = 1 if row != 0
      copy[row + 1][col] = 1 if row != copy.length - 1
    end
    return copy
  end

  def manhattan_blur(amt)
    copy =  Marshal.load(Marshal.dump(@image_data))
    temp = nil
    amt.times do 
      temp = self.blur_image(copy)
    end
    return temp
  end

  def output_image
    @image_data.each { |arr| puts arr.join(" ") }
    puts "\n"
  end

  def output_original_and_blurred_image(amt)
    self.output_image
    puts "Blurred Image:"
    blurred_image_data = self.manhattan_blur(amt)
    blurred_image = self.class.new(blurred_image_data)
    blurred_image.output_image
    puts "------------"
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


puts "3px Transform Image:"
px_edge_transform.output_original_and_blurred_image(2)
puts "1px Transform Image:"
px_edge_transform.output_original_and_blurred_image(1)
puts "3px Transform Image:"
px_edge_transform.output_original_and_blurred_image(3)
puts "1px Transform Image:"
px_edge_transform.output_original_and_blurred_image(1)