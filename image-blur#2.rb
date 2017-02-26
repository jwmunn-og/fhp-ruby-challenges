class Image 
  def initialize(image_data)
    @image_data = image_data
  end
  
  def blur_image
    coords = []
    @image_data.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        coords << [row_idx, col_idx] if col == 1
      end
    end

    coords.each do |row, col|
      @image_data[row][col-1] = 1 if col != 0
      @image_data[row][col+1] = 1 if col != @image_data[0].length - 1
      @image_data[row-1][col] = 1 if row != 0
      @image_data[row+1][col] = 1 if row != @image_data.length - 1
    end
  end

  def output_image
    @image_data.each { |arr| puts arr.join }
    puts "\n"
  end

end

# Make this work
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

px_edge_transform.output_image
px_edge_transform.blur_image
px_edge_transform.output_image