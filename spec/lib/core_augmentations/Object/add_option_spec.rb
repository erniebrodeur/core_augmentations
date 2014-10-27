require 'spec_helper.rb'
require 'core_augmentations/Object/add_option.rb'

describe Object do
  describe '#add_option' do
    it 'should add method by name or symbol' do
      @test_object = Hash.new
      @test_object.add_option('test_string')
      expect(@test_object.methods.include?(:test_string)).to be true
      @test_object = Hash.new
      @test_object.add_option(:test_symbol)
      expect(@test_object.methods.include?(:test_symbol)).to be true
    end
    it 'should return the argument passed to it' do
      @test_object = Array.new
      @test_object.add_option('test')
      tests = [[1,2,3], 'this', 'that', :those, 5]
      tests.each do |t|
        @test_object.test t
        expect(@test_object.test).to eq t
      end
    end
  end
end
