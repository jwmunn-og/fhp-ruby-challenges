# Image blur #1
# Create Image class
class Image 
  def initialize(image_data)
    @image_data = image_data
  end

# ark = ['cat', 'dog', 'pig', 'goat']
# ark2 = ark.each_with_index.map do |a, i|
#    if i % 2 == 1
#       a.capitalize.reverse
#    else
#       a
#    end
# end   
# puts ark2.join(', ')


  def blur_image
    # @image_data[3][1] = 0
    blurred_image = @image_data.each_with_index.map do |row, row_idx|
      # blur pixels
      row.each_with_index.map do |col, col_idx|
        if col == 1
          row[col_idx - 1] = 1
        else
          col
        end
      end
      puts row.join
    end

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

two_px_transform.output_image
two_px_transform.blur_image