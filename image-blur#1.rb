# Create Image class
class Image 
  def initialize(image_data)
    @image_data = image_data
  end

  def output_image
    puts @image_data
  end
end

# Make this work
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image