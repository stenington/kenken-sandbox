require './lib/factorization.rb'

class FactoringProblem
  attr_accessor :target, :desired_factor_count, :max

  def initialize(**opts)
    @target = opts[:target]
    @desired_factor_count = opts[:count]
    @max = opts[:max]
  end

  def solve
    f = Factorization.new(self)
    solutions = Set[]
    kids = Set[f]
    while !kids.empty? do
      solutions << kids.select(&:qualified?).to_set
      kids = kids.map!(&:children).flatten
    end
    solutions.flatten
  end

  def ==(other)
    @target == other.target &&
      @desired_factor_count == other.desired_factor_count &&
      @max == other.max
  end

  def eql?(other)
    self == other
  end

  def hash
    [@target, @desired_factor_count, @max].hash
  end

  def to_s
    "Factoring #{@target} into #{desired_factor_count} factors, max #{@max}"
  end
end

