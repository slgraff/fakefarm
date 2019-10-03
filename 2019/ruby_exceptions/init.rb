class Fruit
  def initialize(type)
    @type = type
  end

  def eat
    raise StandardError, @type
  rescue => e
    require 'pry'; binding.pry
  end
end

apple = Fruit.new('apple')
apple.eat

