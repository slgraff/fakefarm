# Problem 1: Polynomials
def evaluatePoly(poly, x):
    '''
    Computes the value of a polynomial function at given value x. Returns that
    value as a float.

    poly: list of numbers, length > 0
    x: number
    returns: float
    '''
    place = 0
    value = 0.0
    coef  = 0
    power = 0

    while place <= len(poly):
        if poly[place] < 0:
            place += 1
        else:
            coef = poly[place]
            power = x ** place
            value += power * coef
            place += 1
    return value


poly = [0.0, 0.0, 5.0, 9.3, 7.0]
x = -13
print evaluatePoly(poly, x)

## Here's what I get when I call it...

# Traceback (most recent call last):
#   File "ps3_newton.py", line 35, in <module>
#     print evaluatePoly(poly, x)
#   File "ps3_newton.py", line 23, in evaluatePoly
#     if poly[place] < 0:
# IndexError: list index out of range




# Problem 2: Derivatives
def computeDeriv(poly):
    '''
    Computes and returns the derivative of a polynomial function as a list of
    floats. If the derivative is 0, returns [0.0].

    poly: list of numbers, length &gt; 0
    returns: list of numbers (floats)
    '''
    # FILL IN YOUR CODE HERE...





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
