module Circuitizer
  module DSL

    def source(name, value=false)
      self << Source.new(name, value)
    end

    def and_gate(name)
      self << AndGate.new(name)
    end

    def or_gate(name)
      self << OrGate.new(name)
    end

    def reading(name)
      self << Reading.new(name)
    end

    def trace(start_name, end_name)
      self << Trace.new.start(self[start_name]).end(self[end_name])
    end

  end
end
