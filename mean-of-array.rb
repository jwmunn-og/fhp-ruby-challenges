def calc_mean(ary)
  if !ary.is_a?(Array)
    0
  elsif ary.empty?
    0
  else
    ary.inject(:+)/ary.length
  end
end

p calc_mean([]) # should return 0 
p calc_mean([1, 2, 3]) # should return 2.0 
p calc_mean([6, 8, 10]) # should return 8.0 
p calc_mean([15, 30, 60, 120, 240]) # should return 93.0