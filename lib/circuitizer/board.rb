require 'tsort'
require_relative 'dsl'
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
    board_map = BoardMap.topography(edges, nodes)
    node_order = board_map.sort
    node_order.each do |k|
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

