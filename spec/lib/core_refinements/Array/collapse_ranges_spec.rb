require 'spec_helper.rb'
require 'core_refinements/Array/collapse_ranges.rb'
using CoreRefinements::Array::CollapseRanges

describe Array do
  describe "#collapse_ranges" do
    it "Will return a collapsed range" do
      expect([1,2,3,4,5,6,7,9,11,13,14,15].collapse_ranges).to eq [1..7,9,11,13..15]
    end
    it "Will not lose duplicates" do
      expect([1,1,2,3,3,3,4,5].collapse_ranges).to eq [1,1..3,3,3..5]
    end
    it "will not need to be sorted" do
      expect([4,5,6,1,2,3].collapse_ranges).to eq [4..6,1..3]
    end
    it "will return nil if it gets a non Numeric argument" do
      expect([1,2,3,'a'].collapse_ranges).to be nil
    end
    it "Will 'split' the return into two parts (range,singles) with the parameter split." do
      expect([1,2,3,5,7].collapse_ranges(split:true)).to eq([[1..3], [5, 7]])
    end
    it "Will allow a step parameter to include missing values in the ranges." do
      complex_range = [13,1,2,3,4,6,8,11,14,17,20,25,30,35,2]
      complex_2 = [13,1..8,11,14,17,20,25,30,35,2]
      complex_5 = [13,1..35,2]
      expect(complex_range.collapse_ranges(step:1)).to_not eq complex_2
      expect(complex_range.collapse_ranges(step:2)).to eq complex_2
      expect(complex_range.collapse_ranges(step:3)).to_not eq complex_2
      expect(complex_range.collapse_ranges(step:4)).to_not eq complex_2
      expect(complex_range.collapse_ranges(step:5)).to_not eq complex_2
      expect(complex_range.collapse_ranges(step:5)).to eq complex_5
    end
  end
end
