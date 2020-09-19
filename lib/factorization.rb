require 'set'

class Factorization

  attr_reader :problem, :factors

  def initialize(problem, factors=nil)
    @problem = problem
    @factors = (factors || [1, @problem.target]).sort
  end

  def factors_without_ones
    @factors.select { |f| f != 1 }
  end

  def qualified?
    count_correct = factors_without_ones.count <= @problem.desired_factor_count
    all_sizes_correct = @factors.all? { |f| f <= @problem.max }

    all_sizes_correct && count_correct
  end

  def children
    kids = Set[]
    (2..@problem.max).each do |f|
      factors = @factors.sort
      largest = factors.pop
      next if largest == f
      if largest % f == 0
        factors << f
        factors << largest/f
        kids << Factorization.new(@problem, factors)
      end
    end
    kids
  end

  def ==(other)
    @problem == other.problem &&
      @factors.sort == other.factors.sort
  end

  def eql?(other)
    self == other
  end

  def hash
    [@problem, @factors.sort].hash
  end

  def to_a
    padded = factors_without_ones
    while padded.count < @problem.desired_factor_count
      padded.unshift(1)
    end
    padded
  end

  def to_s
    to_a.to_s
  end
end