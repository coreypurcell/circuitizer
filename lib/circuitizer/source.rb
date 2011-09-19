class Source < Node

  def initialize(name=nil, val=false)
    super(name)
    @value = val
  end

  def set(val)
    @value = val
  end

  def output
    @value || false
  end

  alias_method :value, :output
end
