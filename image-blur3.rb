class Image
  def initialize(image_data)
    @image_data = image_data
  end

  def get_ones
    coords = []
    @image_data.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        coords << [row_index, col_index] if col == 1
      end
    end
    return coords
  end
  
  def blur_image(coords)
    image_copy = Marshal.load(Marshal.dump(@image_data))
    coords.each do |row, col|
      image_copy[row][col - 1] = 1 if col != 0
      image_copy[row][col + 1] = 1 if col != image_copy[0].length - 1
      image_copy[row - 1][col] = 1 if row != 0
      image_copy[row + 1][col] = 1 if row != image_copy.length - 1
    end
    return image_copy
  end

   def manhattan_blur(num)
    num.times do 
      coords = self.get_ones
      self.blur_image(coords)
    end
  end

  def output_image
    @image_data.each { |arr| puts arr.join }
    puts "\n"
  end

  def output_manhattan_image(blur_amount)
    self.output_image
    puts "Manhattan Blurred Image:"
    self.manhattan_blur(blur_amount)
    self.output_image
    puts "----"
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

puts "Original Edge Pixels Image:"
one_px_transform.output_manhattan_image(2)

one_px_transform.output_manhattan_image(1)

