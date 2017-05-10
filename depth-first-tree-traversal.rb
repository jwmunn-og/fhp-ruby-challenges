class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

def depth_first(node, search_value)
  return p node if node.payload == search_value
  node.children.each do |child|
    depth_first(child, search_value)
  end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node   = Tree.new(11, [])
fourth_node     = Tree.new(4, [])

# The "Branches" of the tree
ninth_node         = Tree.new(9, [fourth_node])
sixth_node         = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node       = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

depth_first(trunk, 11)