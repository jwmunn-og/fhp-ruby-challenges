class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end

  def self.children
    [@left, @right].compact
  end

  # def children?
  #   @left != nil || @right != nil
  # end

  # def no_children?
  #   !children?
  # end
end

class BTreeSort
  # initialize anything ??

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
      while queue != 0
        n = queue.shift
        # keep going through children until there are no children
        if n.children
          # insert element in place of parent left or right nil
          if n.payload > i
            n.left = node
          else
             n.right = node
          end
        else
          # push children into the queue to keep searching through children
          n.children.each do |child|
            queue.push(child)
          end
        end
      end
    end

    return trunk
  end

  def self.sort(array)
    trunk = self.build(array)
    sorted_array = []
    
    # depth first structure
    trunk.children.each do |child|
      sorted_array << child
      self.sort(child)
    end

    return sorted_array
    # build new sorted array through Depth First Search payload
  end

end



# seven = BinaryTree.new(7, nil, nil)
# five  = BinaryTree.new(5, nil, nil)
# four  = BinaryTree.new(4, nil, nil)
# six   = BinaryTree.new(6, nil, seven)
# three = BinaryTree.new(3, nil, six)
# two   = BinaryTree.new(2, four, five)
# trunk = BinaryTree.new(1, two, three)

array = [7, 4, 9, 1, 6, 14, 10]

p BTreeSort.sort(array)