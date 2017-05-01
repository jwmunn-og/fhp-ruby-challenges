def collatz(n)
  sequence = []

  while n > 1
    if sequence.length == 0
      sequence << n
    elsif n % 2 == 0
       n = n / 2
       sequence << n
    else n % 2 == 1
      n = 3 * n + 1
      sequence << n
    end
  end
  sequence
end

def collatz_comparison(n)
  longest = 0
  (1..n).each do |n|
    if collatz(n).length > collatz(longest).length
      longest = n
    end
  end
  puts "The number with the longest Collatz sequence from 1 to #{n} is #{longest}" 
end

p collatz(7)
collatz_comparison(1000000)