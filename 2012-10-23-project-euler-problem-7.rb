# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?

def prime_number(position)
  primes = []
  x = 0
  number = 1
  while x <= position
    if prime?(number)
      primes << number
      number += 1
      x += 1
    else
      x += 1
      puts "not it"
    end
  end
  return primes
end



def prime?(number)
  if number < 10
    if number == 2 || number == 3 || number == 5 || number == 7
      return true
    else
      return false
    end
  elsif number % (number - 2) == 0 ||
    number % (number - 3) == 0 ||
    number % (number - 4) == 0 ||
    number % (number - 5) == 0 ||
    number % (number - 6) == 0 ||
    number % (number - 7) == 0 ||
    number % (number - 8) == 0 ||
    number % (number - 9) == 0
    return false
  else
    return true
  end
end

puts prime_number(6)



