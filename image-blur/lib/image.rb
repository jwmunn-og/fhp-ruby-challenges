class Image
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def get_ones
    coords = []
    @data.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        coords << [row_index, col_index] if col == 1
      end
    end
    return coords
  end
  
  def blur
    coords = self.get_ones
    complex_copy = Marshal.load(Marshal.dump(@data))
    coords.each do |row, col|
      complex_copy[row][col - 1] = 1 if col != 0
      complex_copy[row][col + 1] = 1 if col != complex_copy[0].length - 1
      complex_copy[row - 1][col] = 1 if row != 0
      complex_copy[row + 1][col] = 1 if row != complex_copy.length - 1
    end
    complex_copy.each { |arr| puts arr.join }
    puts "\n"
    return Image.new(complex_copy)
  end
end