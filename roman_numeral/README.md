# Roman Numeral Kata

## Test Locally

clone repo then,

```
cd gigNow
ruby -Itest roman_numerals_test.rb
```

## About

I was able to support the 3,000 Roman Numberal combiations in a 21 key hash. I explored making the conversion hash smaller but felt the additional complexity to do so would not be worth the added complexity at this stage of the exercise.

My approach was to break the original number into powers of 10 and use recrusion to interrogate it. Once I had a sense of the base, I discovered that some numbers coverted easily and others needed some additional help.

I included a module into the Integer Class as we originally embarked on. There were some unique challenges in that I was not able to use @instance methods on a frozen Integer. That was a new twist for me.
