class Trace
  attr_accessor :start, :end

  def name
    self.object_id.to_s
  end

  def start(el)
    @start = el
    self
  end

  def end(el)
    @end = el
    self
  end
end
