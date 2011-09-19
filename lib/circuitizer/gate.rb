class Gate < Node

  def inputs
    raise "Not implemented, you must override"
  end

end

class AndGate < Gate

  def inputs
    [0, 0]
  end

  def inputs=(ins)
    raise ArgumentError unless ins.size == 2

    @inputs = ins
  end

  def output
    case @inputs
    when [1,1]
      1
    else
      0
    end
  end

end
