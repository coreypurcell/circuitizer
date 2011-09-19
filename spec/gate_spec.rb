require_relative '../lib/circuitizer/node'
require_relative '../lib/circuitizer/gate'
require_relative '../lib/circuitizer/source'
require_relative '../lib/circuitizer/trace'

describe Gate do

  describe AndGate do

    let(:and_gate){ AndGate.new('G1') }

    it { and_gate.inputs.size.should == 2 }

    it "returns 1 if both inputs are 1" do
      and_gate.inputs = [true,true]
      and_gate.output.should == true 
    end

    it "returns 0 all other times" do
      and_gate.inputs = [true,false]
      and_gate.output.should == false
      and_gate.inputs = [false,true]
      and_gate.output.should == false
      and_gate.inputs = [false,false]
      and_gate.output.should == false
    end

    it "shifts an input in" do
      and_gate.input_shift true
      and_gate.inputs.should == [true,nil]
      and_gate.input_shift false
      and_gate.inputs.should == [false, true]
    end

  end


  describe Source do
    it "has an output" do
      Source.new.should respond_to(:output)
    end

    it "can have it's value set" do
      s = Source.new
      s.output.should == false
      s.set(true)
      s.output.should == true
    end

    it "can have it's value set during instansiation" do
      s = Source.new('s1', true)
      s.output.should == true
    end

  end
end


describe Trace do

  it "has a start and an end" do
    Trace.new.should respond_to(:start)
    Trace.new.should respond_to(:end)
  end

end


