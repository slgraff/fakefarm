require_relative './products'

class Report
  def initialize(products)
    @products = products
  end

  def run(red_only: false)
    selection = select_products(red_only)

    money_taken = selection.inject(0) do |total, product|
      (product.price * product.sales) + total
    end

    total_sales = selection.inject(0) do |total, product|
      product.sales + total
    end

    {
      average_sales_price: money_taken / total_sales,
      money_taken: money_taken
    }
  end

  def top_selling(red_only: false)
    select_products(red_only).sort_by(&:sales).last(3)
  end

  def select_products(red_only)
   selection = @products
    if red_only
      selection = selection.select { |product| product.color == 'red' }
    end
    selection
  end
end

sum = -> list { list.inject(:+) }

sales_value = -> products do
  product_revenue = products.map { |product| product.sales * product.price }
  sum[product_revenue]
end

total_sales = -> products { sum[products.map(&:sales)] }

avg_sale_price = -> products { sales_value[products] / total_sales[products] }
# puts avg_sale_price[PRODUCTS]

red = -> products { products.select { |p| p.color == 'red'} }

class FunctionalReport
  def initialize(products, *fns)
    @products = products
    @fns = fns
  end

  def run
    @fns.inject(@products) do |last_result, fn|
      fn[last_result]
    end
  end
end

# puts FunctionalReport.new(PRODUCTS, avg_sale_price).run
# puts FunctionalReport.new(PRODUCTS, red, avg_sale_price).run

# TODO: start at 6:50 with by_attribute
# Goal is to practice currying and understaning generic functions

# Abstract Selection by Comparison
#
# I. Generic Comparison Engine.
# A comparison needs 5 pieces.
# 1. A looping method which will iterate over each item in the list.
# 2. A raw data set of objects with
# 3. A public attribute (key) inside the data set
# 4. An operation for comparing attribute values with value of interest
#    The comparison will be of common options: ==, !=, <=, >=, <, >
# 5. A value to test against.


by_attribute = -> attr, op, value, products do
  products.select { |p| p[attr].send(op, value)}
end


# II. Identify the particular attribute and types of comparison
# The attribute will be part of the listed object's existing values

by_color = by_attribute.curry[:color, :==]


# 3. The two steps specific report is created by a business requirement, which
blue = by_color.curry['blue']

just_a_attr = -> attr, products do
  products.map { |p| p.send(attr) }
end

sales = just_a_attr.curry[:sales]

result = sales[blue[PRODUCTS]]

puts result.inspect

# puts blue[PRODUCTS]

t_shirt = -> brand, size, quantity do
  "#{quantity} #{brand} at #{size} size will cost #{quantity * 2.50}"
end

hanes = t_shirt.curry['hanes']

large = hanes['large']

order = large[100]
# puts order

select = -> line1, line2, line3 do
  "SELECT #{line1} from #{line2} where #{line3}"
end

jv_example = select.curry['jv_example']

all_providers = jv_example.curry['in_network']

under_9 = -> input do
  all_providers[input]
end

# puts under_9['hi']

by_max_rating = by_attribute.curry[:rating, :<]
low_rating = by_max_rating.curry[3]

class ColorFilter
  attr_reader :color
  def initialize(color)
    @color = color
  end

  def apply(products)
    products.select { |p| p.color == @color }.map { |p| self.to_s }
  end

  def to_s
    "Filtering #{self.color} products"
  end
end

filter = ColorFilter.new('green')
out = filter.apply(PRODUCTS).take(3)
puts out




# puts FunctionalReport.new(PRODUCTS, blue, low_rating).run.take(3)

=begin
  # Functional thinking

  So, when would I use a proc in a ruby setting?
  Just as one off, debugging techniques?

  Advantages
  - add features without changing existing code
  - create each step of the report with very little code
  - no need to support unrelated code from other steps

  However...

  notice that it required creating a second, and even third verion of the same thing before I realized what was happening in order to abstract it out. The first step in abstraction is to have concrete

  # Composition

=end
