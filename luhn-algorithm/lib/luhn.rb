module Luhn
  def self.is_valid?(number)
    digits = number.to_s.chars.map(&:to_i)
    reversed_digits = digits.reverse
    double = []

    # Double every other in reverse order
    reversed_digits.each_with_index.map do |digit, index|
      (index + 1).even? ? double << digit * 2 : double << digit
    end
   
    # Un-reverse
    reversed_double = double.reverse

    reversed_double.map! do |n|
      n >= 10 ? n - 9 : n
    end

    arr_sum = reversed_double.inject(:+)

    return arr_sum % 10 == 0    

  end
end

