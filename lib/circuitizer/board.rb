require 'circuitizer'
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

    traces = @elements.inject([]) { |traces, v| traces << v.last if v.last.kind_of? Trace; traces }

    board_map = traces.inject({}) do |m, trace|
      m[trace.start.name] = [] if m[trace.start.name].nil?
      m[trace.start.name] += [trace.end.name]
      m
    end

    p board_map
    p board_map.tsort
  end

  def print
    Graph.new(self).to_dot
  end


end
