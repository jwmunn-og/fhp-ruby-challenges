require 'active_support/all'

num = 2
hash = {
  1 => "One",
  2 => "Two",
  3 => "Three"
}

# puts hash[num]
json_string = '{"1":"One","2":"Two","3":"Three"}'

parsed = ActiveSupport::JSON.decode(json_string)
puts parsed.inspect

puts parsed[1].inspect
puts hash[1].inspect