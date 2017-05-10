def method(hex_value)
  hex_pairs = hex_value.to_s(16).upcase.scan(/../)
  p hex_pairs
  hex_pairs.map do |x|
    (x.hex / 255.0).round(2)
  end
end

p method(0x33BAE7)