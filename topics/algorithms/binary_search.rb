require 'pry';
require 'minitest/autorun';


class BinarySearch
  attr_reader :list
  def initialize(list)
    @list = list
  end

  def value(item)
    list.bsearch { |i| i >= item }
  end

  def position(item)
    list.bsearch_index { |i| i >= item }
    # low = item[0]
    # high = list.size - 1

    # while low <= high
    #   mid = (low + high) / 2
    #   guess = list[mid]
    #   if guess == item
    #     return mid
    #   end
    #   if guess > item
    #     high = mid - 1
    #   else
    #     low = mid + 1
    #   end
    # end
    # 'none'
  end

  def mid(low,high)
    (low + high) / 2
  end
end


describe BinarySearch do
  subject { BinarySearch.new(ten) }
  let (:ten) { [1,3,5,7,9] }

  it 'return the position of requested item' do
    assert_equal 1, subject.position(3)
  end
  it 'return the value of requested item' do
    assert_equal 3, subject.value(3)
  end
end
