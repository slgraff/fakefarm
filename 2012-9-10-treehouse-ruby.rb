# Team Treehouse

# Keys & Values
# Video: http://teamtreehouse.com/library/programming-2/ruby-foundations/hashes/keys-and-values

treehouse =
{
  "business_name" => "Treehouse",
  "location" => "Treehouse Island",
  "phone" => "800 555 5555",
}

# keys
# lists out all the keys
treehouse.keys

# key(argument)
# provide the value and hash returns the key
treehouse.key('Treehouse')

# bracket notation
# enter a hash's key and value will return. Use brackets!
treehouse['phone']

# has_key?
# boolean value, remember to add the "?"
treehouse.has_key?('address')

# member?
# same as has_key?
treehouse.member?('address')

# has_value?
# boolean
treehouse.has_value?('Treehouse')

# values_at
# returns array
treehouse.values_at('business_name','location')
# => ["Treehouse", "Treehouse Island"]


# Working with Hashes
# http://teamtreehouse.com/library/programming-2/ruby-foundations/hashes/working-with-hashes

treehouse =
{
  "business_name" => "Treehouse",
  "location" => "Treehouse Island",
  "phone" => "800 555 5555",
}

# empty?
# boolean
treehouse.empty?

# delete(argument)
business_name = treehouse.delete('business_name')

# clear
# removes all keys and values
treehouse.clear

# to_a
array = treehouse.to_a

# delete_if {}
treehouse.delete_if { |k,v| k == 'location'}
# => {"business_name"=>"Treehouse", "phone"=>"800 555 5555"}

treehouse.delete_if { |k,v| k.include?('p') }
# => {"business_name"=>"Treehouse"}

# Iteration
# http://teamtreehouse.com/library/programming-2/ruby-foundations/hashes/iteration

# each

# each_pair

# each_key
treehouse.each_key { |key| puts "The key is #{key}"}

# each_key
treehouse.each_value { |value| puts "The value is #{value}" }

# select
# safe method
treehouse.select {|key, value| key == 'location'}

# select!
# modifies the hash

#keep_if
# only keeps matching keys, and deletes everything else.
treehouse.keep_if {|key, value| key == 'locaiton'}


# Enumerable
# http://teamtreehouse.com/library/programming-2/ruby-foundations/hashes/enumerable

# find - first item that returns true will be what method returns
treehouse.find { |key, value| key == 'phone'}


# find_all
# finds all that match, not just first.
treehouse.find_all { |key, value| value.match('house')} # match is a method on string.

# all?
# whatever is passed into block that's true will return true
treehouse.all?{|key,value| value.match('house')}


# any?
# boolean returns true if one or more match

# count
# returns number of items in an hash

# map
# adds to each item
treehouse.map {|key, value| value = "(treehouse) #{value}"}
format  = treehouse.map {|key, value| value = "=> #{value}"}

# reject
# safe method similar to select method, but does opposite
# also has reject!
treehouse.reject{|key,value| value.match('house')}

# Instance Methods
# http://teamtreehouse.com/library/programming-2/ruby-foundations/methods/instance-methods

# simple method review
def hello(name='smarty')
    puts "hello #{name}"
end

hello("Dave")


# class instance methods

class BankAccount
  def initialize(first_name, last_name)
    @balance = 0
    @first_name = first_name
    @last_name = last_name
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

bank_account = BankAccount.new("Dave", "Woodall")
puts bank_account.inspect


# class methods
# http://teamtreehouse.com/library/programming-2/ruby-foundations/methods/class-methods

class BankAccount

  attr_reader :balance

  class << self # instead of writting class methods with 'self.method' you can surround them with this line of code, and end them with 'end' (line 182)
    def create_for(first_name, last_name)
      @accounts ||= [] # ||= is conditional assignment operator. Either use exisiting, or create one.
      @accounts << BankAccount.new(first_name,last_name)
    end

    def find_for(first_name, last_name)
      @accounts.find{|account| account.full_name == "#{first_name} #{last_name}"}
    end
  end

  def initialize(first_name, last_name)
    @balance = 0
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

end


bank_account = BankAccount.find_for("Dave", "Woodall")


# method visibility
# http://teamtreehouse.com/library/programming-2/ruby-foundations/methods/visibility


private # anything below this will be marked as private

def reset!
  @balance = 0
end

private :reset!, :transfer_funds # or, put a private with a list of methods to be stated private.

def call_the_reset_method # To make a private method, public put in another method. Classes can call their own private methods.
  reset!
end

# protected methods

def private_reset!
  @balance = 0
end


# protected methods
protected

def protected_reset!
  @balance = 0
end










