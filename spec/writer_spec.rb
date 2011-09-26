require 'circuitizer'
require 'tempfile'

include Circuitizer
describe DotWriter do
  it "writes a board to a file" do
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


    Tempfile.new('testing_circuit.ps') do |file|
      DotWriter.write(b, file.path)
      file.size.should > 0
    end

  end

end
