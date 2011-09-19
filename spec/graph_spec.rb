require_relative '../lib/circuitizer/graph'

describe Graph do

  before do
    @graph = Graph.new
  end

  describe '#add_node' do
    let(:gate) { double("Gate", :name => "GATE") }
    it "adds a node to the nodes array" do
      expect {@graph.add_node(gate)}.should change{@graph.nodes.size}.by(1)
    end

    it "creates a DOT node from a gate node" do
      @graph.add_node(gate)
      @graph.nodes.first.should == "\t\"#{gate.name}\" [shape=box, label=\"#{gate.name}\"]\n"
    end
  end

  describe '#add_edge' do
    let(:trace) { double("Trace", :name => "T1", :start => "G1", :end => "G2", :output => true) }
    it "adds an edge to the edges array" do
      expect {@graph.add_edge(trace)}.should change{@graph.edges.size}.by(1)
    end

    it "creates a dot edge from a trace" do
      @graph.add_edge(trace)
      @graph.edges.first.should == "\t#{trace.start} -> #{trace.end} [label=\"false\"]\n"
    end
  end

end
