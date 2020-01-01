class Node
  attr_accessor :next
  attr_reader :value
  def initialize(value)
    @value = value
  end
end

class Chain
  attr_reader :first, :middle, :last
  def initialize
    @first = Node.new(3)
    @middle = Node.new(5)
    @first.next = middle
    @last = Node.new(7)
    @middle.next = last
  end
end

