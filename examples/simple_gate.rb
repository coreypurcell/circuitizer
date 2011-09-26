require 'circuitizer'
include Circuitizer

board = Board.new do
  source 'S1', true
  source 'S2', true
  source 'S3', false
  reading 'OUT'

  and_gate 'AND'
  or_gate 'OR'

  trace 'S1', 'AND'
  trace 'S2', 'AND'
  trace 'S3', 'OR'
  trace 'AND', 'OR'
  trace 'OR', 'OUT'
end

board.run
DotWriter.write(board, 'simple_gate.ps')
