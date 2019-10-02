    animals = { 'a': ['aardvark'], 'b': ['baboon'], 'c': ['coati']}


    def biggest(aDict):
      result = None
      biggestValue = 0
      for key in aDict.keys():
        if len(aDict[key]) >= biggestValue:
          result = key
          biggestValue = len(aDict[key])
      return result

    print biggest(animals)



### animals = { 'a': ['aardvark'], 'b': ['baboon'], 'c': ['coati']}
A dictionary.

### def biggest(aDict):
method with an argument.

###   result = None
Setting a base value. Protects from throwing an error if nothing is passed into argument.

###   biggestValue = 0
Set base value. This will be used to compare.

###   for key in aDict.keys():
Set up a loop.

The _key_ could be any word as it is a local variable.

The _aDict.keys()_ - further manipulates the content. We don't need all the content to be introduced into the <<code>for</code> loop. That highlight is specific to this use case.

###     if len(aDict[key]) >= biggestValue:
Conditional comparing the specific item in the dictionary with the biggestVale.

I had to get comfortable knowing that the value of <code>aDict[key]</code> was not actually providing the key, but the value. Which is what I want. I think


###       result = key
If that's true, then change the value of <code>result</code> to the content that's sitting in the local variable 'key'.


###       biggestValue = len(aDict[key])
Also, update the variable biggestValue with the length number, if the conditional is true.

###   return result
Return could be anything you want it to be. Here, I want the number from result.

### print biggest(animals)
Now, I need to call the method, with the data I want to analyze.