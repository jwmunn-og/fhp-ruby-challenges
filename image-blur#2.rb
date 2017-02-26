class Image 
  def initialize(image_data)
    @image_data = image_data
  end


  def blur_image
    coords = []
    @image_data.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        if col == 1
          coords << [row_idx, col_idx]
        else
          col
        end
      end
    end

    coords.each do |x|
      @image_data[x[0]][x[1]-1] = 1
      @image_data[x[0]][x[1]+1] = 1
      @image_data[x[0]-1][x[1]] = 1
      @image_data[x[0]+1][x[1]] = 1
    end
    
    # puts coords.inspect

  end

  def output_image
    @image_data.each do |arr|
      puts arr.join
    end
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
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])

px_edge_transform.output_image
px_edge_transform.blur_image
px_edge_transform.output_image