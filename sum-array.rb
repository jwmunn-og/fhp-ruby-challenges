# Sum Numbers
def sum(numbers)
  # Original refactored solution
  # numbers.length == 0 ? 0 : numbers.reduce(:+)

  # Can be refactored to 
  numbers.inject(0, :+)
end

p sum([]) # 0
p sum([1, 5.2, 4, 0, -1]) # 9.2)