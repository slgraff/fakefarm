# Case statements are easier to reason about than if/else.

# 1. setup a pretend class
Message = Struct.new(:membership?)

# 2. Instantiate an object
@message = Message.new(false)

# 3. use
def filter
  case
    when loyal_member then welcome_member
    when new_customer then welcome_new_customer
  else
    []
  end
end

# 4. create a true condition
def loyal_member
    @message.membership? == true
end

# 5. create response when condition is true
def welcome_member
  'Welcome loyal membe!'
end

# 6. 2nd when example..

def new_customer
    @message.membership? == false
end

def welcome_new_customer
  'Welcome new customer!'
end

# 7. Run to see how it works
# ruby case_statement.rb
puts filter