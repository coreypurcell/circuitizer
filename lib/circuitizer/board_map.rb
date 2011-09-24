require 'tsort'

class BoardMap < Hash
  include TSort

  alias tsort_each_node each_key

  def tsort_each_child(node, &blk)
    fetch(node).each(&blk)
  end

  def self.topography(edges, nodes)
    board_map = BoardMap.new
    nodes.each { |node| board_map[node.name] = [] }
    edges.each { |edge| board_map[edge.start.name] += [edge.end.name] }
    board_map
  end

  def sort
    board_order = tsort.reverse
  end

end
