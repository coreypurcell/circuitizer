class Source < Node

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  def set(val)
    @value = val
  end

  def output
    @value || 0
  end

  alias_method :value, :output
end
