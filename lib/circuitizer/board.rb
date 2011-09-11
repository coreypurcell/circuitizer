require 'circuitizer'

class Board

  attr_accessor :elements

  def initialize
    @elements = {}
  end

  def <<(element)
    @elements[element.name] = element
  end

  def [](name)
    @elements[name]
  end

  def run
  end


end
