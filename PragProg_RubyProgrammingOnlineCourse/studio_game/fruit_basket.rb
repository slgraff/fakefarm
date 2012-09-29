=begin
doctest: "create new fruit"
>> apple = Fruit.new('fuji')
=> "Yum Fuji!"
doctest: "add new fruit to basket"
>> cart.add_to_basket(apple)
=> 'Fuji added to basket'
=end

class Fruit

  def initialize(type)
    @type = type.capitalize
    "Yum #{@type}!"
  end
end



class Basket

  def initialize
     @fruit = []
  end

end

