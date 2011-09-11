require 'lib/circuitizer/gate'
require 'lib/circuitizer/source'
require 'lib/circuitizer/trace'

describe Gate do

  describe AndGate do

    let(:and_gate){ AndGate.new }

    it { and_gate.inputs.size.should == 2 }

    it "returns 1 if both inputs are 1" do
      and_gate.inputs = [1,1]
      and_gate.output.should == 1
    end

    it "returns 0 all other times" do
      and_gate.inputs = [1,0]
      and_gate.output.should == 0
      and_gate.inputs = [0,1]
      and_gate.output.should == 0
      and_gate.inputs = [0,0]
      and_gate.output.should == 0
    end

  end


  describe Source do
    it "has an output" do
      Source.new.should respond_to(:output)
    end

    it "can have it's value set" do
      s = Source.new
      s.output.should == 0
      s.set(1)
      s.output.should == 1
    end

  end
end


describe Trace do

  it "has a start and an end" do
    Trace.new.should respond_to(:start)
    Trace.new.should respond_to(:end)
  end

end


