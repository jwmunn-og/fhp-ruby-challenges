def sum_upto(n)
  return 1 if n == 1
  return sum_upto(1) + 2 if n == 2
  return sum_upto(2) + 3 if n == 3

end

p sum_upto 1
p sum_upto 2
p sum_upto 3
p sum_upto 4