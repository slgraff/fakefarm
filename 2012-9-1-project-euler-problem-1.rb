# ABOUT: Project Euler Problem 1

# STATUS: My test is passing. Why? Seems like it should be failing sinc there is no output in the method. 
# Answer - had a '==>' instead of a '=>' doah!

# SETUP:
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# PROBLEM:
# Find the sum of all the multiples of 3 or 5 below 1000.

# TESTS:
=begin
doctest: Show all numbers below 10 that are multiples of 3 or 5
>> sum_of_multiples(10) 
=> "3, 5, 6, 9"

doctest: Test the sum of the multiples
>> sum_of_multiples(10)
=> 23

=end

def sum_of_multiples(number)
  winners = []
  1.upto(number-1) do |num|
    if num % 3 == 0 || num % 5 == 0  
      winners << num
    end
  end
  winners.inject(:+)
end

puts sum_of_multiples(1000)
# => 233168