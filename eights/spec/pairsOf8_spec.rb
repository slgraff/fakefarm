require 'spec_helper'

describe "The combinations_of_eight method" do

  it "holds unique combinations" do
    numbers = [1,2,5,7,4,3,12,6]
    combinations_of_eight(numbers).should_not == [[1, 7], [7,1], [6,2],[5,3], [2, 6], [3, 5]]
  end

  it "returns an array of arrays that equal 8" do
    numbers = [1,2,5,7,4,3,12,6]
    combinations_of_eight(numbers).should == [[1, 7], [2, 6], [3, 5]]
  end

  it "protects against double counting indexes" do
    numbers = [4]
    combinations_of_eight(numbers).should_not == [4,4]
  end

  it "will count double numbers as unqiue" do
    numbers = [4,4]
    combinations_of_eight(numbers).should == [4,4]
  end
end