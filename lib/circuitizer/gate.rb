class Gate < Node

  def inputs
    raise "Not implemented, you must override"
  end

end

class AndGate < Gate

  def inputs
    @inputs ||= [nil, nil]
  end

  def inputs=(ins)
    raise ArgumentError unless ins.size == 2

    @inputs = ins
  end

  def input_shift(value)
    @inputs = inputs.unshift(value)[0..1]
  end

  def output
    case @inputs
    when [true, true]
      true
    else
      false
    end
  end

end
