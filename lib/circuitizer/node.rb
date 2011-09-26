module Circuitizer
  class Node
    attr_reader :name

    def initialize(name=nil)
      @name = name
    end

    def to_s
      name
    end

    def shape
      "circle"
    end

  end
end
