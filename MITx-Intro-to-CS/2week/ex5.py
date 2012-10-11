# iteration = 0
# count = 0
# array = 'hello, world'
# while iteration < 5:
#   for x in array:
#     count += 1
#   print("Iteration " + str(iteration) + "; count is: " + str(count))
#   iteration += 1

# print str("---------")

# iteration = 0
# while iteration < 5:
#   count = 0
#   for letter in 'hello, world':
#     count += 5
#   print("Iteration " + str(iteration) + "; count is: " + str(count))
#   iteration += 1

#     # = > Iteration 0; count is: 60
#     # = > Iteration 1; count is: 60
#     # = > Iteration 2; count is: 60
#     # = > Iteration 3; count is: 60
#     # = > Iteration 4; count is: 60


# print str("---------")

iteration = 0
while iteration < 5:
    count = 0
    for letter in "hello, world":
        count += 1
        if iteration % 2 == 0:
            break
    print("Iteration " + str(iteration) + "; count is: " + str(count))
    iteration += 1