class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end
end

class BTreeSort
  def self.build(array)
    first = array[0]
    trunk = BinaryTree.new(first, nil, nil)
    rest = array.last(array.length - 1)

    
   
    # loop through rest array
    rest.each do |i|
      queue = []
      queue.push(trunk)
     
      node = BinaryTree.new(i, nil, nil)
      # find where node should go in the tree
      while queue.length != 0
        n = queue.shift

        if i < n.payload
            if n.left == nil
                n.left = node
             else
                 queue.push(n.left)
             end
        else
            if n.right == nil
                n.right = node
             else
                 queue.push(n.right)
             end
        end
        
      end
    end

    return trunk
  end

  def self.in_order(node, sorted_array)

    return "Done" if node == nil 
        
    self.in_order(node.left, sorted_array)
    sorted_array << node.payload
    self.in_order(node.right, sorted_array)

    return sorted_array
  end

  def self.sort(array)
    trunk = self.build(array)
    sorted_array = []

    return self.in_order(trunk, sorted_array)
  end

end


array = [7, 4, 9, 1, 6, 14, 10]

p BTreeSort.sort(array)