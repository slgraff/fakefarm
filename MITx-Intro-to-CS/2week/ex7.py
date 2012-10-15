def square(x):
  '''
  x: int or float.
  '''
  value = abs(x) * abs(x)

  return value

print square(5)

def evalQuadratic(a,b,c,x):
  '''
  a,b,c: numerical values for the coefficients of a quadratic equation
  x: numerical value at which to evaluate the quadratic
  '''

  return a * x**2 + b * x + c

print evalQuadratic(1,2,3,4)


def clip(lo,x,hi):
  return min(max(x,lo), hi)


print clip(4,5,6)

def test(lo,x):
  '''
  - low, when x < lo
  '''
  max(x,lo)

print test(3,2)


def fourthPower(x):
  return x**4

print fourthPower(23)

print "----------"

def odd(x):
  return x % 2 != 0

print odd(5)

print "----------"

def isVowel(char):
  if char == 'a' or char == 'e' or char == 'i' or char == 'o' or char == 'u':
    return True

  elif char == 'A' or char == 'E' or char == 'I' or char == 'O' or char == 'U':
    return True
  else:
    return False


print isVowel('a')
print isVowel('v')

print "----------"


def isVowel2(char):
  for letter in char:
    if letter == "a" or letter == "e" or letter == "i" or letter == "o" or letter == "u":
      return True

print isVowel2("a")

print "----------"














