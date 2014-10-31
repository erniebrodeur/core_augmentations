require 'spec_helper.rb'
require 'core_refinements/Numeric/percentage_of'

describe Numeric do
  describe "#percentage_of" do
    # Goddamn, some days.  I really need to figure out how to phrase this better.
    it "Given an argument, return the percentage of the number in self." do
      expect(10.percentage_of(100)).to eq 10
      expect(10.percentage_of(990)).to eq 1.01
    end
    it "Will round given a round: parameter." do
      expect(10.percentage_of(667281,5)).to eq 0.0015
    end
  end
end
