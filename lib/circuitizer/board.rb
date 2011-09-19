require 'tsort'
class Hash
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &blk)
    fetch(node).each(&blk)
  end
end

class Board

  attr_accessor :elements

  def initialize
    @elements = {}
  end

  def <<(element)
    @elements[element.name] = element
  end

  def [](name)
    @elements[name]
  end

  def nodes
    @elements.inject([]) { |nodes, v| nodes << v.last unless v.last.kind_of? Trace; nodes }
  end
  
  def edges
    @elements.inject([]) { |traces, v| traces << v.last if v.last.kind_of? Trace; traces }
  end

  def run
    # walk the tree of traces from left to right

    board_map = edges.inject({}) do |m, trace|
      m[trace.start.name] = [] if m[trace.start.name].nil?
      m[trace.start.name] += [trace.end.name]
      m
    end
    board_map = nodes.inject(board_map) do |m, node|
      unless m[node.name]
        m[node.name] = []
      end
      m
    end

    board_order = board_map.tsort.reverse

    board_order.each do |k|
      board_map[k].each do |element|
        @elements[element].input_shift(@elements[k].output)
      end
    end

  end

  def print
    Graph.new(self).to_dot
  end

end
