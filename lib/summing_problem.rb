require 'set'
require './lib/summation.rb'

class SummingProblem

  attr_reader :target, :desired_addends, :max, :repetition

  def initialize(**opts)
    @target = opts[:target]
    @desired_addends = opts[:count]
    @max = opts[:max]
    @repetition = opts[:repetition]
  end

  def solve
    solutions = Set[]

    attempt = Array.new(@desired_addends, 1)
    done = false
    while !done do
      s = Summation.new(self, attempt.dup)
      solutions << s if s.qualified?

      idx = 0
      carry = true
      while carry && idx < attempt.count
        if attempt[idx] + 1 > @max
          attempt[idx] = 1
          idx = idx + 1
        else
          attempt[idx] = attempt[idx] + 1
          carry = false
        end
      end

      done = carry
    end

    solutions
  end

  def ==(other)
    @target == other.target &&
      @desired_addends == other.desired_addends &&
      @max = other.max
  end

  def eql?(other)
    self == other
  end

  def to_s
    "Divide #{@target} into #{@desired_addends} addends, max #{@max}"
  end
end
