get_ones = [[1,1]]
pairs = [[0,1], [1,0], [-1,0], [0,-1]]

coords_to_change = pairs.map do |row, col|
  [row + 1, col + 1]
end

p coords_to_change



  