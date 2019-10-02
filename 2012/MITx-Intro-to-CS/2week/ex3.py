greeting = "Hello!"
count = 0

for zebra in greeting:
  count += 1
  if count % 2 == 0:
    print(greeting)
  print(greeting)

print('done')

school = 'Massachusetts Institute of Technology'
numVOlwels = 0
numCons = 0

for char in school:
  if char == 'a' or char == 'e' or char == 'i' or char == 'o' or char == 'u':
    numVOlwels += 1
  elif char == 'o' or char == "M":
    print (char)
  else:
    numCons -= 1

print('numVOlwels is: ' + str(numVOlwels))
print('numCons is: ' + str(numCons))
