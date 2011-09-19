require_relative '../lib/circuitizer/board'

describe Board do

  before do
    @b = Board.new
    @b << Source.new('a')
    @b << Source.new('b')
    @b << AndGate.new('gate')
    @b << Trace.new.start(@b['a']).end(@b['gate'])
    @b << Trace.new.start(@b['b']).end(@b['gate'])
    @b << Reading.new('out')
    @b << Trace.new.start(@b['gate']).end(@b['out'])

    @b['a'].set true
    @b['b'].set true
  end

  it "evaluates a single AND gate" do
    @b.run

    @b['out'].value.should == true
    @b['gate'].output.should == true
  end

  it "prints a DOT for the board" do
    @b.print.should match(/digraph/)
  end

  it "sets the edge labels equal to the trace values after run" do
    @b.run
    @b.print.should match(/gate -> out \[label="true"\]/)
  end

end
