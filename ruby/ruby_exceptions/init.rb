class Fruit
  def initialize(type)
    @type = type
  end

  def eat
    if @type == 'apple'
      raise FruitIsDead.new('boom is my message that I raised')
    else
      puts 'yummy'
    end
  rescue => e
    puts e.class.name
    puts e.message
    puts e.backtrace
  end

  class FruitIsDead < StandardError; end
end

banana = Fruit.new('banana')
banana.eat

apple = Fruit.new('apple')
apple.eat

