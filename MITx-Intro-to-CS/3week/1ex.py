# Problem 7
print "-- Ex 7 ---------------------"

def lenRecur(string):
  if string == '':
    return 0
  print string
  return 1 + lenRecur(string[1:])

print lenRecur('hello')




# Problem 6
print "-- Ex 6 ---------------------"

def lenIter(string):
  count = 0
  for number in string:
      count += 1
  return count

print lenIter('hello')


# Problem 5
print "-- Ex 5 ---------------------"

def gcdIter(a,b):

  if b == 0:
    return a
  elif a == b:
    return a
  else:
    return gcdIter(b, a % b)


print gcdIter(2,12)
print gcdIter(6,12)
print gcdIter(9,12)
print gcdIter(17,12)
print gcdIter(867,1989)

# Problem 4
print "-- Ex 4 ---------------------"

def gcdIter(a,b):
  x = a
  while x > 0:
    if a % x == 0 and b % x == 0:
      return x
    else:
      x -= 1

print gcdIter(2,12)
print gcdIter(6,12)
print gcdIter(9,12)
print gcdIter(17,12)

# Problem 3

print "-- Ex 3 ---------------------"


def recurPowerNew(base, exp):

    # Base case is when exp = 0
    if exp <= 0:
        return 1

    # Recursive case 1: exp > 0 and even
    elif exp % 2 == 0:
        return recurPowerNew(base*base, exp/2)

    # Otherwise, exp must be > 0 and odd, so use the second
    #  recursive case.
    return base * recurPowerNew(base, exp - 1)

print recurPowerNew(2,2)
print recurPowerNew(2,3)
print recurPowerNew(2,0)


print "--------------------"
# Problem 2

def recurPower(base,exp):
  if exp <= 0:
    return 1
  else:
    return base * recurPower(base, exp-1)

print recurPower(1,2)
print recurPower(2,2)
print recurPower(3,2)
print recurPower(4,2)



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





















