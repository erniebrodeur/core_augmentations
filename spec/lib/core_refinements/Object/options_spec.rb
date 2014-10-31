require 'spec_helper.rb'
require 'core_refinements/Object/options.rb'
using CoreRefinements::Object::Options

describe CoreRefinements do
  describe Object do
    before (:each) do
    end
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
    describe '#list_options' do
      it "should return the list of options as an array when given no argument" do
        @test_object = Array.new
        @test_object.add_option('test')
        @test_object.add_option(:test2)
        expect(@test_object.list_options).to eq [:test, :test2]
      end
    end
  end
end
