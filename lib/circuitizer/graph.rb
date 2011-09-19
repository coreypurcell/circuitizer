class Graph
  attr_reader :nodes, :edges

  def initialize(board=nil)
    @nodes = []
    @edges = []
    @board = board
  end

  def add_node(node)
    @nodes << dot_node(node.name)
  end

  def add_edge(trace, val=nil)
    val ||= false
    @edges << dot_edge(trace.start, trace.end, val )
  end

  def to_dot
    @board.nodes.each { |n| add_node(n) }
    @board.edges.each { |e| add_edge(e, e.value) }
    dot_header +
      @nodes.join +
      @edges.join +
      dot_footer
  end

  private

  def dot_header
    "digraph {\n\tgraph[overlap=false, splines=true]\n"
  end

  def dot_footer
    "}\n"
  end

  def dot_node(name)
    "\t#{quote(name)} [#{options(name)}]\n"
  end

  def dot_edge(start_name, end_name, val)
    "\t#{start_name.to_s} -> #{end_name.to_s} [label=#{edge_value(val)}]\n"
  end

  def edge_value(val)
    '"' + val.to_s + '"'
  end

  def options(name)
    'shape=box, label="' + name.to_s + '"'
  end

  def quote(name)
    '"' + name.to_s + '"'
  end
end
