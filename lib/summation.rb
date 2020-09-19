class Summation

  attr_reader :problem, :addends

  def initialize(problem, addends=nil, **opts)
    @problem = problem
    @addends = addends
  end

  def qualified?
    qualifies = @addends.sum == @problem.target
    if !@problem.repetition.nil?
      qualifies && @addends.all? { |a| @addends.count(a) <= @problem.repetition }
    else
      qualifies
    end
  end

  def ==(other)
    @problem == other.problem &&
      @addends.sort == other.addends.sort
  end

  def eql?(other)
    self == other
  end

  def hash
    [@problem, @addends.sort].hash
  end

  def to_a
    @addends.sort
  end

  def to_s
    to_a.to_s
  end
end
