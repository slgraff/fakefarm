class Fruit

attr_accessor :color, :price, :quantity

@@count = 0
@@value = 0


    class << self

      def total_count
        "Total Fruit is: #{@@count}"
      end

      def total_value
        "Total value is : $#{@@value}"
      end

    end

  def initialize(price,quantity=1)
    @@count += 1
    @price = price.to_f
    @quantity = quantity.to_i
    puts "Yum fruit!"
    value = price * quantity
    @@value += value
  end

    def cost
    value = @quantity * @price
    "Your $#{value}"
  end

end

apple = Fruit.new(0.5, 13)
apple2 = Fruit.new(0.95, 8)
puts apple.cost
puts apple2.cost

puts Fruit.total_count
puts Fruit.total_value
