class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data
  
  def initialize
    @data = nil
  end
  
  # Push a value onto the stack
  def push(value)
     @data = LinkedListNode.new(value, @data)
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
    if @data == nil
        return nil
    end
        
    node_value = @data.value
    @data = @data.next_node

    return node_value
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

def reverse_list(list)
    
    reversed_stack = Stack.new

    # p list
    
    while list != nil
      reversed_stack.push(list)
      list = list.next_node
    end
#     p reversed_stack.data
    
    new_list = nil
    new_value = reversed_stack.pop

    while new_value != nil
        p new_value

        if new_list == nil
            new_list = new_value
        else 
            # traverse the end of new_list and attach the node there
            last_node = new_list
            while last_node.next_node != nil
                last_node = last_node.next_node
            end
            p last_node
            last_node.next_node = new_value
            ####
            new_value.next_node = nil
            #  new_list = new_list.next_node
        end
            
        new_value = reversed_stack.pop
    end
    
    return new_list
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)

print_values(revlist)

# Desired output: 
# 12 --> 99 --> 37 --> nil
# ------
# 37 --> 99 --> 12 --> nil


