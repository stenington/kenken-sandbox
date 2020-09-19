require "./lib/factorization.rb"

RSpec.describe Factorization do
  it "should initialize to factorization by 1" do
    p = FactoringProblem.new(target: 21, count: 2, max: 8)
    f = Factorization.new(p)
    expect(f.factors).to include(1, 21)
  end

  it "should ignore factor ordering in equality check" do
    p = FactoringProblem.new(target: 21, count: 2, max: 8)
    f1 = Factorization.new(p, [1, 3, 7])
    f2 = Factorization.new(p, [1, 7, 3])
    expect(f1).to eq(f2)
    expect(f1).to eql(f2)
  end

  describe ".qualified?" do
    it "should be qualified when 1's can be dropped" do
      p = FactoringProblem.new(target: 21, count: 2, max: 8)
      expect(Factorization.new(p, [1, 3, 7])).to be_qualified
    end

    it "should be qualified when 1 can be used" do
      p = FactoringProblem.new(target: 21, count: 3, max: 8)
      expect(Factorization.new(p, [1, 3, 7])).to be_qualified
    end

    it "should be qualified when 1's can be added" do
      p = FactoringProblem.new(target: 21, count: 4, max: 8)
      expect(Factorization.new(p, [1, 3, 7])).to be_qualified
    end
  end

  it "should not have children" do
    p = FactoringProblem.new(target: 21, count: 2, max: 8)
    f = Factorization.new(p, [1, 3, 7])
    expect(f.children).to be_empty
  end

  it "should have children" do
    p = FactoringProblem.new(target: 6, count: 2, max: 8)
    f = Factorization.new(p)
    expect(f.children).not_to be_empty
  end

  describe ".to_s" do
    it "should print without 1's" do
      p = FactoringProblem.new(target:21, count: 2, max: 8)
      f = Factorization.new(p, [1, 3, 7])
      expect(f.to_s).to include("[3, 7]")
    end

    it "should print with 1" do
      p = FactoringProblem.new(target:21, count: 3, max: 8)
      f = Factorization.new(p, [1, 3, 7])
      expect(f.to_s).to include("[1, 3, 7]")
    end

    it "should print with padded 1's" do
      p = FactoringProblem.new(target:21, count: 5, max: 8)
      f = Factorization.new(p, [1, 3, 7])
      expect(f.to_s).to include("[1, 1, 1, 3, 7]")
    end
  end
end