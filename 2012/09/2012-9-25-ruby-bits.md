#Ruby Bits

## Level 1 Expressions

### Unless
### Implied Nil
### Conditional Assignment
### Conditional Return
### Short-circuit evaluation

##Level 2 Methods and Classes

### Hash Arguments

## Questions
- How do I write a raise expception.
Having difficulty on; http://rubybits.codeschool.com/levels/2/challenges/3


## Level 3 Classes

### Ecapsulation
### Visibility
### Inheritance
### Super
### Overriding methods
### Hiding instance variables

## Level 4 Active Support

_install_
gem install activesupport
gem install i18n

_load it;_
require 'active_support/all'

### Array
array.from(4)
array.to(2)
array.in_groups_of(3)
array.split(2)

### Date
.advance

### Hash
.diff
.stringify_keys
.reverse_merge
.except
.asser_valid_keys

### Integer
.odd?
.even?

###Inflectors


## Level 5 Modules

### Namespace
create a module called ImageUtils
then write methods in there


### Mixins
when you want to use them, you require the file

    require 'image_utils'

    class Image
        include ImageUtils
    end
When you include it, then you can use the module methods as instance methods;

image = user.image
image.preview


### Ancestors




### Mixins vs. Class Inheritance

syntax for inheritance

    Post < Sharable
    end

The problem though, is that Post can only inherit from one class. And you want the inheritance to make sense.

A mixin can be used multiple times using include;

    Post
        include Sharable
        include Maxible
    end


### Mixin

using the extend method, you can give methods to classes as well.

    module Searchable
        def find_all_from(user)
        end
    end

    class Tweet
        extend Searchable
    end

    Tweet.find_all_from('@Dave')

**Extend**
Use Extend to expose module methods as class methods.

You can also extend methods to instances by using the extend method

    image.extend('utils')
    image.preview

**Include**
Use Include if you want to expose methods as instance methods.

### Hooks - Self.included


### ActiveSupport::Concern

## Level 6 Blocks

### Using Blocks
.each

### Yield

### Yield - Arguments

### Yield - Return Value

































