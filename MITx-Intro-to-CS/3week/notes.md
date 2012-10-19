# Iteration
# State variables
i is the iteration number; starts at b
result is current value of computation; starts at 0

# Update rules
i  <- i - 1; stop when 0
result <- result + a

## Recursion

– Solve a smaller problem
– Solve a basic   problem
– Solve a smaller problem

## Inductive reasoning

To prove a statement indexed on inteters is true for all values of in.

- prove it is true when n is smallest value


def recur(a,b)
if b == 1
puts "hi"
else
a + recur(a, b-1)
end
end

Programs need
- Base
- State
- Behavior