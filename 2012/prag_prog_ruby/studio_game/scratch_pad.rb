def movie(title, rank=title.length)
  current_time = Time.new
  today = current_time.strftime("%A")
  "#{title.upcase} has a rank of #{rank} as of #{today}"
end

puts movie("Texas", 10)

x = 'banana'

puts movie(x)

def ten
  puts 10
end

def call_ten(tenny)
  tenny
end

call_ten(ten)


def shirt(qty)
  qty * 5.50
end

def ink(colors)
  colors * 3.50
end

def cost(shirt, ink)
  puts shirt * ink
end

cost(shirt(5), ink(10))


def say_hello(name, health=100)
  "I'm #{name.capitalize} with a health of #{health} as of #{current_time}"
end

def current_time
  Time.now.strftime("%I:%M:%S%P")
end

puts say_hello('dave', 99)
puts say_hello('danae', 98)
puts say_hello('reg', 67)
puts say_hello('tom')