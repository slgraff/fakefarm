require 'pry';
require 'minitest/autorun';

class SelectionSort

  def sort(unsorted)
    sorted = []
    unsorted.length.times do |i|
      smallest = find_smallest_index(unsorted)
      sorted.push(unsorted[smallest])
      unsorted.delete(unsorted[smallest])
    end
    sorted
  end

  def find_smallest_index(arr)
    smallest = arr[0]
    smallest_index = 0
    arr.length.times do |i|
      if arr[i] < smallest
        smallest = arr[i]
        smallest_index = i
      end
    end
    smallest_index
  end
end

describe SelectionSort do
  subject { SelectionSort.new }
  let (:list) { [5,3,6,2,10] }
  let (:sorted) { [2,3,5,6,10] }

  it 'find_smallest_index' do
    assert_equal 3, subject.find_smallest_index(list)
  end

  it 'selection sort' do
    assert_equal sorted, subject.sort(list)
  end
end
