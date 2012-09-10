# # Team Treehouse

# # Keys & Values
# # Video: http://teamtreehouse.com/library/programming-2/ruby-foundations/hashes/keys-and-values

# treehouse =
# {
#   "business_name" => "Treehouse",
#   "location" => "Treehouse Island",
#   "phone" => "800 555 5555",
# }

# # keys
# # lists out all the keys
# treehouse.keys

# # key(argument)
# # provide the value and hash returns the key
# treehouse.key('Treehouse')

# # bracket notation
# # enter a hash's key and value will return. Use brackets!
# treehouse['phone']

# # has_key?
# # boolean value, remember to add the "?"
# treehouse.has_key?('address')

# # member?
# # same as has_key?
# treehouse.member?('address')

# # has_value?
# # boolean
# treehouse.has_value?('Treehouse')

# # values_at
# # returns array
# treehouse.values_at('business_name','location')
# # => ["Treehouse", "Treehouse Island"]


# # Working with Hashes
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/hashes/working-with-hashes

# treehouse =
# {
#   "business_name" => "Treehouse",
#   "location" => "Treehouse Island",
#   "phone" => "800 555 5555",
# }

# # empty?
# # boolean
# treehouse.empty?

# # delete(argument)
# business_name = treehouse.delete('business_name')

# # clear
# # removes all keys and values
# treehouse.clear

# # to_a
# array = treehouse.to_a

# # delete_if {}
# treehouse.delete_if { |k,v| k == 'location'}
# # => {"business_name"=>"Treehouse", "phone"=>"800 555 5555"}

# treehouse.delete_if { |k,v| k.include?('p') }
# # => {"business_name"=>"Treehouse"}

# # Iteration
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/hashes/iteration

# # each

# # each_pair

# # each_key
# treehouse.each_key { |key| puts "The key is #{key}"}

# # each_key
# treehouse.each_value { |value| puts "The value is #{value}" }

# # select
# # safe method
# treehouse.select {|key, value| key == 'location'}

# # select!
# # modifies the hash

# #keep_if
# # only keeps matching keys, and deletes everything else.
# treehouse.keep_if {|key, value| key == 'locaiton'}


# # Enumerable
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/hashes/enumerable

# # find - first item that returns true will be what method returns
# treehouse.find { |key, value| key == 'phone'}


# # find_all
# # finds all that match, not just first.
# treehouse.find_all { |key, value| value.match('house')} # match is a method on string.

# # all?
# # whatever is passed into block that's true will return true
# treehouse.all?{|key,value| value.match('house')}


# # any?
# # boolean returns true if one or more match

# # count
# # returns number of items in an hash

# # map
# # adds to each item
# treehouse.map {|key, value| value = "(treehouse) #{value}"}
# format  = treehouse.map {|key, value| value = "=> #{value}"}

# # reject
# # safe method similar to select method, but does opposite
# # also has reject!
# treehouse.reject{|key,value| value.match('house')}

# # Instance Methods
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/methods/instance-methods

# # simple method review
# def hello(name='smarty')
#     puts "hello #{name}"
# end

# hello("Dave")


# # class instance methods

# class BankAccount
#   def initialize(first_name, last_name)
#     @balance = 0
#     @first_name = first_name
#     @last_name = last_name
#   end

#   def deposit(amount)
#     @balance += amount
#   end

#   def withdraw(amount)
#     @balance -= amount
#   end
# end

# bank_account = BankAccount.new("Dave", "Woodall")
# puts bank_account.inspect


# # class methods
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/methods/class-methods

# class BankAccount

#   attr_reader :balance

#   class << self # instead of writting class methods with 'self.method' you can surround them with this line of code, and end them with 'end' (line 182)
#     def create_for(first_name, last_name)
#       @accounts ||= [] # ||= is conditional assignment operator. Either use exisiting, or create one.
#       @accounts << BankAccount.new(first_name,last_name)
#     end

#     def find_for(first_name, last_name)
#       @accounts.find{|account| account.full_name == "#{first_name} #{last_name}"}
#     end
#   end

#   def initialize(first_name, last_name)
#     @balance = 0
#     @first_name = first_name
#     @last_name = last_name
#   end

#   def full_name
#     "#{@first_name} #{@last_name}"
#   end

#   def deposit(amount)
#     @balance += amount
#   end

#   def withdraw(amount)
#     @balance -= amount
#   end

# end


# bank_account = BankAccount.find_for("Dave", "Woodall")


# # method visibility
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/methods/visibility


# private # anything below this will be marked as private

# def reset!
#   @balance = 0
# end

# private :reset!, :transfer_funds # or, put a private with a list of methods to be stated private.

# def call_the_reset_method # To make a private method, public put in another method. Classes can call their own private methods.
#   reset!
# end

# # protected methods

# def private_reset!
#   @balance = 0
# end


# # protected methods
# protected

# def protected_reset!
#   @balance = 0
# end


# # Creating Loops
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/loops/creating-loops

# i = 0

# while i <= 10
#   puts "i is now #{i}"
#   i += 1
# end

# # Until Loop
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/loops/until-loops

# name = ""

# until name == "Dave" do
#   print "What is your name? "
#   name = gets.chomp
#   puts "Hello, #{name}"
# end

# # For Loops
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/loops/for-loops

# array = [1,2,3,4,5,6]

# for i in array do
#   puts "i is #{i}"
# end

# puts "Outside of the loop, i is #{i}" # => i == 6... looks like i is a local, and not a block varaible.

# # using for loops with ranges

# for i in 1..10 do
#   puts "i is #{i}"
# end

# # loop inside a loop (nested loop)

# for i in 1..5 do # outer loop
#   for j in 1..5 do # inner loop
#     puts "i is #{i}, j is #{j}"
#   end
# end


# # for in loop
# for animal in %w(dog cat horse goat shake) do
#   puts "The current animal is #{animal}"
# end


# # control flow
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/loops/control-flow

# # next if
# # next if skips if condition is true, but keeps going.
# for animal in %w(dog cat horse goat shake frog) do
#   next if animal == "cat"
#   puts "The current animal is #{animal}"
# end

# # break
# # breaks entirely out of the loop if condition is met.

# for animal in %w(dog cat horse goat shake frog) do
#   break if animal == "cat"
#   puts "The current animal is #{animal}"
# end

# # loop do
# # now that I know about break, I can do a conditional based on proper password.

# pass = ''
# loop do
#   print "Enter the password: "
#   pass = gets.chomp
#   if pass == "swordfish"
#     puts "Access Granted... Continue to InternetLand"
#     break
#   end
#   puts "Sorry, You are stuck in the past."
# end



# # retry if
# # getting a syntax error but can't find it.
# animals = %w(dog cat horse goat snake frog)
# count = 0

# for animal in animals
#   puts "The current animal is #{animal}"
#   break if count == 10
#   count += 1
#   retry if animal == 'horse'
# end

# # redo if
# #
# animals = %w(dog cat horse goat snake frog)
# count = 0

# for animal in animals
#   puts "The current animal is #{animal}"
#   break if count == 10
#   count += 1
#   redo if animal == 'horse'
# end


# # Creating blocks
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/blocks/creating-blocks

# def say_hello(&block)
#   puts "hello, world"
#   block.call
# end

# say_hello{ puts "goodnite, moon" }

# Working with Blocks
# http://teamtreehouse.com/library/programming-2/ruby-foundations/blocks/working-with-blocks

# block_given?
# checks to see if a block is given, since blocks are optional

# def say_hello(&block)
#   puts "hello, world"
#   if block_given?
#     block.call
#   else
#     puts "None given"
#   end
# end

# say_hello


# print a name in a block, then print inside the method.

#
# another example

# def header &block
#   puts "This is our header"
#   block.call
# end

# header do
#  puts "This is the body of the block"
# end

# # Ensure
# # Use ensure if some kind of exception might be rasied.

# def header &block
#   puts "This is our header"
#   block.call
# ensure
#   puts 'this is my footah!'
# end

# header do
#  puts "This is the body of the block"
# end


# # rescue block
# # allows us to recover gracefully from an error

# def header &block
#   puts "This is our header"
#   block.call
# rescue
#   puts "this is where we would resuce an error."
# ensure
#   puts 'this is my footah!'
# end

# header do
#  puts "This is the body of the block"
#  raise "this is an error"
# end

# # BEGIN & END blocks
# # Useful for cleaning up your program, or refreshing the state

# puts "This is the first line of our Ruby program."

# BEGIN { puts "INSIDE THE BEGIN BLOCK"}
# END { puts "INSIDE OF THE END BLOCK"}


# # Yield
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/blocks/yield

# # yield breaks out of a method, runs a block, then returns to the method it was called in.
# # advantage of yield is that you can call it as many times as you want.

# def say_hello(&block)
#   puts "hello, world"
#   yield
#   puts "I said yello!"
#   yield
# end

# say_hello do
#   puts "I am inside the say_hello block."
# end


# yield example with numbers
def show_numbers(numbers= 10)
  i = 0
  while i < 10
    yield i
    i += 1
  end
end

show_numbers do |number|
  puts "The current number is #{number}"
  number = number * 2
  puts "The current number multiplied by 2 #{number}."
end









