animals = { 'a': ['aardvark'], 'b': ['baboon'], 'c': ['coati']}

animals['d'] = ['donkey']
animals['d'].append('dog')
animals['d'].append('dingo')

def biggest(aDict):
  # result = None
  biggestValue = 0
  for key in aDict.keys():
    if len(aDict[key]) >= biggestValue:
      result = key
      biggestValue = len(aDict[key])
      print "this is the result " + str(result)
      print "this is the biggest value " + str(biggestValue)
  return result

print biggest(animals)
print biggest({})







# animals = { 'a': ['aardvark'], 'b': ['baboon'], 'c': ['coati']}

# animals['d'] = ['donkey']
# animals['d'].append('dog')
# animals['d'].append('dingo')
# animals['c'].append('a')
# animals['c'].append('a')
# animals['c'].append('a')
# animals['c'].append('a')
# animals['c'].append('a')

# # def biggest(aDict):
# #   if aDict == {}:
# #     return None
# #   else:
# #     return max(aDict.values)

# # print biggest(animals)

# def biggest(aDict):
#   result = None
#   biggestValue = 0
#   for key in aDict.keys():
#     if len(aDict[key]) >= biggestValue:
#       result = key
#       biggestValue = len(aDict[key])
#   return result

# print biggest(animals)






# def biggest(aDict):
#     result = None
#     biggestValue = 0
#     for key in aDict.keys():
#         if len(aDict[key]) >= biggestValue:
#             result = key
#             biggestValue = len(aDict[key])
#     return result

# def howMany(aDict):
#   result = 0
#   for value in aDict.values():
#     result += len(value)
#     print "The value is: " + str(value)
#   return result

# print howMany(animals)


# def howMany2(aDict):
#     '''
#     Another way to solve the problem.

#     aDict: A dictionary, where all the values are lists.

#     returns: int, how many individual values are in the dictionary.
#     '''
#     result = 0
#     for key in aDict.keys():
#         result += len(aDict[key])
#     return result



# def applyToEach(List, function):
#     for i in range(len(List)):
#         List[i] = function(List[i])

# testList = [1, -4, 8, -9]


# # >>> print testList
# # [1, 16, 64, 81]


# def squares(argument):
#   return argument * argument

# applyToEach(testList, squares)


# print testList



# # >>> print testList
# # [2, -3, 9, -8]

# def applyToEach(List, function):
#   for i in range(len(List)):
#     List[i] = function(List[i])

# def addOne(a):
#   a += 1
#   return a

# applyToEach(testList, addOne)

# print testList

# print "------------------"

# testList = [1, -4, 8, -9]

# # >>> print testList
# # [1, 4, 8, 9]


# def positive(argument):
#   return abs(argument)

# applyToEach(testList, positive)

# print testList


# print "------------------"

# testList = [1, -4, 8, -9]

# def timesFive(argument):
#   return argument * 5

# applyToEach(testList, timesFive)

# print testList


