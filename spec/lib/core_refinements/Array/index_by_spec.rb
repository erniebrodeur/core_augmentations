require 'spec_helper.rb'
require 'core_refinements/Array/index_by'
using CoreRefinements::Array::IndexBy
describe CoreRefinements do
  describe Array do
    describe "#index_by" do
      before (:all) do
        @array = [
          [1,2,3],
          [4,5,6],
          ['a','b','c'],
          ['d','e','f'],
          ['cat', 'dog', 'bird']
        ]
        @hash = [
          {id:11, x:2, y:3},
          {id:22, x:2, y:5},
          {id:33, x:4, y:4}
        ]
      end
      describe Hash do
        it "Will index an array of hashes by key." do
          new_hash = @hash.index_by :id
          expect(new_hash[11]).to eq @hash.first
        end
        it "Will return nil if it can't find the key." do
          expect(@hash.index_by :not_real).to be nil
        end
      end
      describe Array do
        it "Will index an array of hashes by position." do
          new_array = @array.index_by 0
          expect(new_array[@array.last.first]).to eq @array.last
        end

        it "Will return nil if it can't find the position." do
          expect(@array.index_by @array.count+1).to be nil
        end
      end
    end
  end
end
