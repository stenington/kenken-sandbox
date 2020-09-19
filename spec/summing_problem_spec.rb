require './lib/summing_problem.rb'

RSpec.describe SummingProblem do
  it "should be equal" do
    sp1 = SummingProblem.new(target: 14, count: 3, max: 6)
    sp2 = SummingProblem.new(target: 14, count: 3, max: 6)
    expect(sp1).to eq(sp2)
    expect(sp1).to eql(sp2)
  end

  it "should have expected solutions" do
    sp = SummingProblem.new(target: 14, count: 3, max: 6)
    solutions = sp.solve
    expect(solutions.count).to be 4
    expect(solutions).to include(Summation.new(sp, [6, 6, 2]))
    expect(solutions).to include(Summation.new(sp, [6, 5, 3]))
    expect(solutions).to include(Summation.new(sp, [6, 4, 4]))
    expect(solutions).to include(Summation.new(sp, [5, 5, 4]))
  end

  describe "repetition" do
    it "should not limit by default" do
      sp = SummingProblem.new(target: 9, count: 5, max: 8)
      solutions = sp.solve
      expect(solutions).to include(Summation.new(sp, [1, 1, 2, 2, 3]))
      expect(solutions).to include(Summation.new(sp, [1, 1, 1, 2, 4]))
      expect(solutions).to include(Summation.new(sp, [1, 1, 1, 1, 5]))
    end

    it "should optionally limit" do
      sp = SummingProblem.new(target: 9, count: 5, max: 8, repetition: 2)
      solutions = sp.solve
      expect(solutions).to include(Summation.new(sp, [1, 1, 2, 2, 3]))
      expect(solutions).not_to include(Summation.new(sp, [1, 1, 1, 2, 4]))
      expect(solutions).not_to include(Summation.new(sp, [1, 1, 1, 1, 5]))
    end
  end
end
