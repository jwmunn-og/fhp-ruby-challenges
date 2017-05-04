class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end


def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end



def reverse_list(list, previous=nil)

  # Option 1
  while list != nil
    old_next_node = list.next_node
    list.next_node = previous
    previous = list
    list = old_next_node
  end

print_values(previous)

  

  # Recursion
  # def recursion
  #   return "#something" if list.value == nil

  #   recursion(something)
  # end

  # return previous

  # Option 2
  # while list
  #     previous_next_node = list.next_node
  #     list.next_node = previous
  # end
    
end

def recurrsive_reverse(list)
  # Work for single node list
  # 37 -> nil
  return list if list.next_node == nil
  # remove node until 1 remains
  # 99 -> 37 -> nil
  # 99 -> nil
  # 37 -> 99 -> nil
  # 37 -> 99 -> nil
  current_node = list
  current_node.next_node = nil

  list = list.next_node
  recurrsive_reverse(list)
  list.next_node = current_node
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

reverse_list(node3)

# print_values(node1)

# Desired output: 
# 12 --> 99 --> 37 --> nil
# ------
# 37 --> 99 --> 12 --> nil