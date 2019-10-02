class Order
  attr_accessor :sm, :md, :lg

  def sizes(sm=0,md=0,lg=0)
    @sm, @md, @lg = sm, md, lg
  end

  def total_sizes
    @sm + @md + @lg
  end

  def add_large(qty)
    @lg += qty
  end

end

tshirt = Order.new
puts tshirt.inspect
tshirt.sizes(5,3)
puts tshirt.total_sizes
tshirt.add_large(204)
puts tshirt.total_sizes