require 'lib/circuitizer/board'

describe Board do

  it "evaluates a single and gate" do
    b = Board.new
    b << Source.new('A')
    b << Source.new('B')
    b << AndGate.new('Gate')
    b << Trace.new.start(b['A']).end(b['Gate'])
    b << Trace.new.start(b['B']).end(b['Gate'])
    b << Reading.new('Out')
    b << Trace.new.start(b['Gate']).end(b['Out'])

    b['A'].set 1
    b['B'].set 1
    b.run

    b['Out'].value.should == 1

  end
end
