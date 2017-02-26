a = [1,2,3,4,5]

def reverse(array)
  length = array.length - 1
  
  (array.length / 2).times do |i|
    temp = array[i]
    array[i] = array[length - i]
    array[length - i] = temp
  end
  
 return array  
       
end
puts "Original order: #{a.join(" ")}"
puts "Now reversed: #{reverse(a).join(" ")}"