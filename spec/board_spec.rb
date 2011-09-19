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

    @b['Out'].value.should == true
  end

  it "prints a DOT for the board" do
    @b.print.should match(/digraph/)
    puts @b.print
  end

end
