# def union(set1, set2):
#   if len(set1) == 0:
#     return set2
#   elif set1[0] in set2:
#     return union(set1[1:], set2)
#   else:
#     return set1[0] + union(set1[1:], set2)


# print union("clippy", "ball")

# def integerDivision(x, a):
#     """
#     x: a non-negative integer argument
#     a: a positive integer argument

#     returns: integer, the integer division of x divided by a.
#     """
#     count = 0
#     while x >= a:
#         count += 1
#         x = x - a
#     return count

# print integerDivision(5, 3)

# def f(n):
#    """
#    n: integer, n >= 0.
#    """
#    if n == 0:
#       return 1
#    else:
#       return n * f(n-1)


# print f(3)
# print f(1)
# print f(0)


def intToStr(i):
  digits = '0123456789'
  if i ==0:
    return '0'
    result = ''
    while i > 0:
      result = digits[i%10] + result
      i = i/10
    return result