class Trace
  attr_accessor :start, :end

  def name
    self.object_id.to_s
  end

  def value
    @start.output if @start
  end

  def start(el = nil)
    if el
      @start = el
      self
    else
      @start
    end
  end


  def end(el=nil)
    if el
      @end = el
      self
    else
      @end
    end
  end
end
