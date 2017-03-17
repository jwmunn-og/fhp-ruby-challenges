class Image 
  attr_accessor :image_data
  def initialize(image_data)
    @image_data = image_data
    # @blurred_img = Array.new(img.length) { Array.new(img.length, 0 )}
  end

  def get_ones
    coords = []
    image_data.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        coords << [row_index, col_index] if col == 1
      end
    end
    return coords
  end

  def pairs(n)
    pairs = []

    (n+1).times do |x|
      (n+1).times do |y|
        if x.abs + y.abs <= n
          pairs << [x, y]
          pairs << [-x, y]
          #do something
        end
      end
    end
    # return pairs
    pairs.each {|arr| p arr}
  end

  def blur_image(n)
    coords = self.pairs(n)
    complex_copy = []
    coords.each do |row, col|
      complex_copy[row][col] = 1
    end
    complex_copy.each { |arr| puts arr.join }
    puts "\n"
  end

  def output_original_image
    @image_data.each { |arr| puts arr.join }
    puts "\n"
  end

  def output_original_and_blurred_image(num)
    puts "Original Image:"
    self.output_original_image
    puts "Pairs:"
    self.pairs(num).each{|arr| p arr}
    puts "Blurred Image"
    self.blur_image(num)
  end

end

one_px_transform = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

one_px_transform.pairs(2)
