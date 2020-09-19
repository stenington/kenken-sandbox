require './lib/factoring_problem.rb'

RSpec.describe FactoringProblem do
  it "should be equal" do
    fp1 = FactoringProblem.new(target: 10, count: 3, max: 8)
    fp2 = FactoringProblem.new(target: 10, count: 3, max: 8)
    expect(fp1).to eq(fp2)
    expect(fp1).to eql(fp2)
  end

  it "should solve 560 into 4 factors, size 8" do
    fp = FactoringProblem.new(target: 560, count: 4, max: 8)
    solutions = fp.solve
    expect(solutions.count).to be 2
    expect(solutions.map(&:factors)).to include([1, 2, 5, 7, 8])
    expect(solutions.map(&:factors)).to include([1, 4, 4, 5, 7])
  end

  it "should solve 4 into 3 factors, size 6" do
    fp = FactoringProblem.new(target: 4, count: 3, max: 6)
    solutions = fp.solve
    expect(solutions.map(&:factors)).to include([1, 4])
    expect(solutions.map(&:factors)).to include([1, 2, 2])
  end
end

