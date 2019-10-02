# Test Driven Development at [TeamTreeHouse](http://teamtreehouse.com/library/programming-2/ruby-foundations/testing)

## MiniTest::Spec

in order to use


require 'minitest/autorun'
require 'minitest/spec'

instead of writing a Class, we put out tests inside a describe block

    describe "MyTests" do

        before do
            puts "Tests are beginning."
        end

        it "adds 2 + 2" do
            (2+2).must_equal 4
        end

        it 'includes a frog' do
            %w(dog cat frog).must_include('frog')
        end

        it 'must be a fixnum' do
        (2+2).must_be_instance_of Fixnum
        end

        it 'should raise an error' do
         array = []
         lambda { array.hello}.must_raise NoMethodError
        end
    end


## Test Driven Development
