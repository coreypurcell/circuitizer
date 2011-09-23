require 'tsort'
require_relative 'dsl'

class BoardMap < Hash
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &blk)
    fetch(node).each(&blk)
  end
end

class Board

  include DSL

  attr_accessor :elements

  def initialize(&blk)
    @elements = {}
    instance_exec(&blk) if block_given?
  end

  def <<(element)
    @elements[element.name] = element
  end

  def [](name)
    @elements[name]
  end

  def nodes
    els = @elements.reject { |name, node| node.kind_of? Trace }
    els.values
  end

  def edges
    els = @elements.select { |name, node| node.kind_of? Trace }
    els.values
  end

  def run
    # walk the tree of traces from left to right

    board_map = BoardMap.new
    board_map = edges.inject(board_map) do |m, trace|
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

  def outputs
    readings = nodes.select { |n| n.kind_of? Reading }
    readings.inject({}) { |s, r| s[r.name] = r.value; s }
  end

  def print
    Graph.new(self).to_dot
  end

end

