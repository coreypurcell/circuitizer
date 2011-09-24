class Gate < Node

  def inputs
    raise "Not implemented, you must override"
  end

  def shape
    "box"
  end

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

end

class AndGate < Gate

  def output
    if @inputs == [true, true]
      true
    else
      false
    end
  end

end

class OrGate < Gate

  def output
    if @inputs == [false, false]
      false
    else
      true
    end
  end

end

class XorGate < Gate

  def output
    case @inputs
    when [true, false]
      true
    when [false, true]
      true
    else
      false
    end
  end

end
