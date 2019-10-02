require './products'

sum = -> list do
  list.reduce(&:+)
end

sales_value = -> products do
  product_revenue = products.map { |product| product.sales * product.price }
  sum[product_revenue]
end

total_sales = -> products { sum[products.map(&:sales)] }
avg_sale_price = -> products { sales_value[products] / total_sales[products] }

# puts avg_sale_price[PRODUCTS]

red = -> products { products.select { |p| p.color == 'red' } }

# puts red[PRODUCTS]

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

puts FunctionalReport.new(PRODUCTS, avg_sale_price).run
puts FunctionalReport.new(PRODUCTS, red, avg_sale_price).run

=begin
 As I code, I can think of small bits to be used as inputs to other functions.
 I cannot tell what patterns will emerge until I become familiar with the domain space in which I am existing.
=end

green = -> products { products.select { |p| p.color == 'green'} }
green_count = -> products { green[products].count }

puts "green count: #{green_count[PRODUCTS]}"
puts FunctionalReport.new(PRODUCTS, green, avg_sale_price).run

=begin
  # example 1
  The data shifted underneath my feet! So, I must be aware that
  - data can be nil
  - data can be different contract
  -

  green count: 0
Traceback (most recent call last):
  5: from functional_demo.rb:44:in `<main>'
  4: from functional_demo.rb:28:in `run'
  3: from functional_demo.rb:28:in `inject'
  2: from functional_demo.rb:28:in `each'
  1: from functional_demo.rb:29:in `block in run'
functional_demo.rb:13:in `block in <main>': undefined method `/' for nil:NilClass (NoMethodError)
=end

=begin
  May 16, 2019

  The kind of coding practice I am doing now is trying to think about the consequences of the code I write. While some of it is syntax. The real reason I spend time coding in the morning will be to become comfortable in a new mental state of mind. As a software developer, I must think about abstract flows of data.

  This profession lends itself well to people who truly want to expand their mind. For, in thinking about software, one must think in abstract, coherant, systems.

  What then are techniques, tips, and topics that can help my mind become fertile for this kind of thinking? I would hope that simply a consciousness and awareness of this space could be a big part of it. That, progress can be made in very subtle, quite, and soft ripples which give birth to powerful tidel waves of change.

  To put it another way, it takes time to think. Though there is not much external activity during the process of thinking, thinking is the most powerful tool in your quest to become a senior software developer. For, thinking requires gathering requirements, obstacles, and constraints to create something intangible which has not been made for this situation. Sure, other people have solved similar problems for their own solutions. But I cannot eat at their table. I can only gleen the techniques in which they share that brought fruit to theirs.

  When you establish time to think, be prepared to start the journey heading in one direction, only to discover that you may find a more boutiful path which leads you off the path you originally intended at the outset. For, a more fruitful learning path will certainly entice you to depart from the original plan and find the mental fruit found by the willing adventureur. For in software study, the purpose is to improve the craft. There will be times when you realize that you can improve by learning another more valuable concept which was uncovered while studying a simplier one. From my current point of view, I recommend abandoning simple study for the advanced subjects you encounter organically.

  For example, I am studying Ruby Functional Syntax. I am following along with a tutorial which I have watched 3 times now. [this one]. In my study, I noticed that my data produced above [example 1] was randomly not producing results. This is a very real situation when dealing with data. Data is unreliable and it pays to program with this awareness. In this simple exercise, I am learning a valuable lesson which is not the focus of Ruby functional syntax.

  So, what are my discplines to provide me time to think?
    - set aside time
    - set aside the exercises that create thought
    - make thinking a priority
    - incorporate this into my daily practice
    - improve my ability to switch in and out of thinking
=end