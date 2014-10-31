require 'spec_helper.rb'
require 'core_refinements/Array/collapse_ranges.rb'

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
  end
end
