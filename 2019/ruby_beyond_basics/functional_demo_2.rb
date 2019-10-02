require_relative './products'

class Report
  def initialize(products)
    @products = products
  end

  def run(red_only: false)

    selection = @products
    if red_only
      selection = selection.select { |product| product.color == 'red' }
    end

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
end

# puts Report.new(PRODUCTS).run(red_only: true)
# puts Report.new(PRODUCTS).run

=begin
  May 17, 2019

  "people are happy and this leads to new requirements"

  For the sake of this demo, he is intenionally violating SRP.
  But it gives me thought to consider how when requirements change, I should be reinterpreting my management of them with the following principals in mind:

  - avoid Conditionals
  - already prepared for change
  - Ruby is designed to manage change well. I must learn how to think from a Ruby OO way.

  I can continue to do so by studying advanced programming concepts such as:
  - patterns
  - SOLID
  - refactoring
=end

class Report2
  def initialize(products)
    @products = products
  end

  def run
    money_taken = @products.inject(0) do |total, product|
      (product.price * product.sales) + total
    end

    total_sales = @products.inject(0) do |total, product|
      product.sales + total
    end

    {
      average_sales_price: money_taken / total_sales,
      money_taken: money_taken
    }
  end
end

class ProductFilter
  def initialize(products)
    @products = products
  end

  def filter(value=nil)
    value ? @products.select { |product| product.color == value } : @products
  end
end

all = ProductFilter.new(PRODUCTS).filter
red = ProductFilter.new(PRODUCTS).filter('red')

puts Report2.new(red).run
puts Report2.new(PRODUCTS).run


=begin
  May 17, 2019

  # Ruby Training topics
  - blocks
  - enumerable methods (Lynda)
  - Rails Performance
  - Functional
  - Meta programming
  - File mgmt
  - enumerable
  - enumerator
  - Exception Handling
  - Logging
  - Debugging
  - Object Space
  - Benchmarking
  - Refactoring
=end