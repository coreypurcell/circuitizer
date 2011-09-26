require_relative '../lib/circuitizer'

include Circuitizer
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

  it "shows the outputs" do
    @b.run
    @b.outputs.should == {'out' => true}
  end

  context 'with a more complex circuit' do
    it "solves stacked gates" do
      b = Board.new
      b << Source.new('S1', true)
      b << Source.new('S2', true)
      b << Source.new('S3', true)
      b << AndGate.new('G1')
      b << AndGate.new('G2')
      b << Reading.new('O')
      b << Trace.new.start(b['S1']).end(b['G1'])
      b << Trace.new.start(b['S2']).end(b['G1'])
      b << Trace.new.start(b['S3']).end(b['G2'])
      b << Trace.new.start(b['G1']).end(b['G2'])
      b << Trace.new.start(b['G2']).end(b['O'])

      b.run
      b['O'].output.should == true

      b['S3'].set false
      b.run
      b['O'].output.should == false
    end
  end

  context 'using a better DSL' do
    it "solves a circuit" do
      b = Board.new do
        source 's1', true
        source 's2', true
        and_gate 'AND'
        reading 'OUT'
        trace 's1', 'AND'
        trace 's2', 'AND'
        trace 'AND', 'OUT'
      end
      b.run
      b['OUT'].output.should == true
    end
  end

end
