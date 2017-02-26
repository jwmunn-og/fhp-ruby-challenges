arr = ['Bob', 'Zed', 'cat', 'apple'].sort_by do |x|
   x.upcase
end

puts arr.join(', ')