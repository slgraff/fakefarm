# TESTS:
=begin
doctest: Shirt color is red
>> x = Shirt.new('red')
>> x.color = 'red'
=> "red"

doctest: Shirt color is blue
>> x.color='blue'
=> "blue"

doctest: Quantity is 50
>> x.quantity = 50
=> 50

doctest:
>> newshirt = Shirt.new('blue', 50)
=> "50 blue t-shirts have been pulled"

=end

class Shirt

  attr_accessor :color, :quantity

  def initialize(color, quantity=1)
      @color = color
      @quantity = quantity.to_i
      "#{@quantity} #{@color} t-shirts have ben pulled"
  end
end











