require "./lib/summation.rb"

RSpec.describe Summation do
  it "should ignore addend order in equality check" do
    p = SummingProblem.new(target: 14, count: 3, max: 6)
    s1 = Summation.new(p, [6, 5, 3])
    s2 = Summation.new(p, [5, 3, 6])
    expect(s1).to eq(s2)
    expect(s1).to eql(s2)
  end

  describe 'limiting repetition' do
    it "should qualify with two or fewer of the same addends" do
      sp = SummingProblem.new(target: 9, count: 5, max: 8, repetition: 2)
      expect(Summation.new(sp, [1, 1, 2, 2, 3])).to be_qualified
      expect(Summation.new(sp, [1, 1, 1, 2, 4])).not_to be_qualified
    end

    it "should qualify with three or fewer of the same addend" do
      sp = SummingProblem.new(target: 9, count: 6, max: 8, repetition: 3)
      expect(Summation.new(sp, [1, 1, 2, 2, 3])).to be_qualified
      expect(Summation.new(sp, [1, 1, 1, 2, 4])).to be_qualified
      expect(Summation.new(sp, [1, 1, 1, 1, 2, 3])).not_to be_qualified
    end
  end

  describe '.to_s' do
    it "should print ordered addends" do
      p = SummingProblem.new(target: 14, count: 3, max: 6)
      s = Summation.new(p, [6, 5, 3])
      expect(s.to_s).to include("[3, 5, 6]")
    end
  end
end
