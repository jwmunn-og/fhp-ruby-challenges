def add_numbers(num1,num2)
  return num1 + num2
end

def subtract_numbers(num1, num2)
  return num1 - num2
end

add_numbers2 = lambda do |num1, num2|
  return num1 + num2
end

subtract_numbers2 = lambda do |num1, num2|
  return num1 - num2
end

puts subtract_numbers(3,4)
puts subtract_numbers2.call(3,4)