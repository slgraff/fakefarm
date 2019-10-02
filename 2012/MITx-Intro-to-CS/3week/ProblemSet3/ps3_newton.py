# # Problem 1: Polynomials
# def evaluatePoly(poly, x):
#     '''
#     Computes the value of a polynomial function at given value x. Returns that
#     value as a float.

#     poly: list of numbers, length > 0
#     x: number
#     returns: float
#     '''
#     place = 0
#     value = 0.0
#     coef  = 0
#     power = 0

#     while place <= len(poly):
#         if poly[place] < 0:
#             place += 1
#         else:
#             coef = poly[place]
#             power = x ** place
#             value += power * coef
#             place += 1
#     return value


# poly = [0.0, 0.0, 5.0, 9.3, 7.0]
# x = -13
# print evaluatePoly(poly, x)

# ## Here's what I get when I call it...

# # Traceback (most recent call last):
# #   File "ps3_newton.py", line 35, in <module>
# #     print evaluatePoly(poly, x)
# #   File "ps3_newton.py", line 23, in evaluatePoly
# #     if poly[place] < 0:
# # IndexError: list index out of range




# Problem 2: Derivatives

# - 13.39 + 17.5x^2 + 3x^3 + x^4
# >>> poly = [-13.39, 0.0, 17.5, 3.0, 1.0]
# >>> print computeDeriv(poly)
# [0.0, 35.0, 9.0, 4.0] # 35x + 9x^2 + 4x^3


def computeDeriv(poly):
  place = 0
  coef  = 0.0
  power = 1
  my_poly = []

  if len(poly) == 1:
    my_poly.append(0.0)

  else:
    while place < len(poly):

      if place > 0:
        coef = poly[place] * power
        my_poly.append(coef)
        place += 1
        power += 1
      else:
        place += 1

  return my_poly


poly = [-13.39, 0.0, 17.5, 3.0, 1.0]
print computeDeriv(poly)


print computeDeriv([17])


# Problem 3: Newton's Method
def computeRoot(poly, x_0, epsilon):
    '''
    Uses Newton's method to find and return a root of a polynomial function.
    Returns a list containing the root and the number of iterations required
    to get to the root.

    poly: list of numbers, length > 1.
         Represents a polynomial function containing at least one real root.
         The derivative of this polynomial function at x_0 is not 0.
    x_0: float
    epsilon: float > 0
    returns: list [float, int]
    '''
    # FILL IN YOUR CODE HERE...


# poly will be a list
# x_0 is the root
# epsilon is the state







































