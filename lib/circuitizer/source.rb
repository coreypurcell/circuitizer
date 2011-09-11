class Source < Node


  def set(val)
    @value = val
  end

  def output
    @value || 0
  end

  alias_method :value, :output
end
