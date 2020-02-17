quantity = ARGV[0].to_i

def fib(n)
  return 1 if n <= 1
  fib(n - 1) + fib(n - 2)
end

fibb = []

quantity.times do |i|
  fibb << fib(i)
end

p fibb.uniq
