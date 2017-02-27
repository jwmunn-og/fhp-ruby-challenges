def nthterm(first, n, c)
  
  n.times { |i| [first] << arr[i] + c}
  p [n]
end

nthterm(1, 2, 3)