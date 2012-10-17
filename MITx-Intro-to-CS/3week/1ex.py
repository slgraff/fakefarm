# Class notes

# Recursion ----------------
# Example

def recurMul(a,b):
  if b == 1:
    return a
  else:
    return a + recurMul(a, b - 1)

print recurMul(3,5)

# Comments
# Recursion is using the same idea, repeatedly, but adjusted and compared to a base case.

# Ex 1 --------------

def iterPower(base,exp):

  if exp == 0:
    return round(1,4)

  else:

    result = base

    while exp > 1:
      result = result * base
      exp -= 1

  return  round(result, 4)

# Lesson learned here;
# Study and know the business case before programing.
# For example, in this exercise there are two unique, but vital situations
# 1. Multiplying by 0 is zero
# 2. An Exponent of 0 makes the problem 1.
# Both of these tripped up my initial attempts.





















