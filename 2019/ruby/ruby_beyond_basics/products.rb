Product = Struct.new(:price, :rating, :color, :sales)
PRODUCTS = []
50.times do
  PRODUCTS << Product.new(rand(1..100), rand(1..3), ['red', 'green', 'blue', 'yellow'][rand(0..3)], rand(300..9090))
end


