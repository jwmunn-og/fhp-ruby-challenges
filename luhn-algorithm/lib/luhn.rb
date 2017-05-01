module Luhn
  def self.is_valid?(number)
    digits = number.to_s.chars.map(&:to_i)
    reversed_digits = digits.reverse
    double = []

    puts "Split:"
    p digits

    puts "Reverse:"
    p reversed_digits

    reversed_digits.each_with_index.map do |digit, index|
      if (index + 1).even?
        double << digit * 2
      else
        double << digit
      end
    end
    puts "Double:"
    p double

    puts "Reverse Double:"
    reversed_double = double.reverse
    p reversed_double

    reversed_double.map! do |n|
      if n >= 10
        n - 9
      else
        n
      end
    end

    puts "Minus 9 if over 10:"
    p reversed_double

    puts "Sum:"
    arr_sum = reversed_double.inject(:+)
    p  arr_sum

    puts "Valid?:"
    return arr_sum % 10 == 0    

  end
end

p Luhn.is_valid?(4194560385008504)
puts "---"
p Luhn.is_valid?(4194560385008505)
puts "---"
p Luhn.is_valid?(377681478627336)
puts "---"
p Luhn.is_valid?(377681478627337)
