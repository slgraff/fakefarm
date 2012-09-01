=begin
  doctest: Testing to confirm Dog class exists
  >> d = Dog.new("Leo")
  >> d.class
  ==> Dog 
  
  doctest: Confirm dog responds to eat method
  >> d.eat
  ==> nil

  doctest: Confirm dog responds to bark method
  >> d.bark
  ==> nil

  doctest: Confirm dog responds to chase_cat method
  >> d.chase_cat
  ==> nil

  doctest: Create a method for individual instances
  >> d = Dog.new('Lassie')
  >> d.teach_trick(:dance) { "#{@name} is dancing!" }
  >> puts d.dance
  ==> "Lassie is dancing!"

  doctest: Objects can hold more than one custom instance method
  >> d.teach_trick(:poo) { "#{@name} is a smelly doggy!" }
  >> puts d.poo
  ==> "Lassie is a smelly doggy!"

  doctest: Show that Objects do not inherit object methods
  >> d2=Dog.new('Fido')
  >> puts d2.dance
  ==> "Fido doesn't know how to dance!"

  doctest: Object method with second instance
  >> d2.teach_trick(:laugh) { "#{@name} finds this hilarious!" }
  >> puts d2.laugh
  ==> "Fido finds this hilarious!"

  doctest: Show that Lassie can't laugh
  >> puts d.laugh
  ==> "Lassie doesn't know how to laugh!"

  doctest: New instance does not get other instance methods
  >> d3=Dog.new('Stimpy')
  >> puts d3.dance
  ==> "Stimpy doesn't know how to dance!"
  >> puts d3.laugh
  ==> "Stimpy doesn't know how to laugh!"

=end

class Dog

  def initialize(name)
    @name = name
  end

  def eat
  end
  
  def bark
  end

  def chase_cat
  end

  def teach_trick(name, &block)
    self.define_singleton_method name, block
  end

  def method_missing(m, *args)
    "#{@name} doesn't know how to #{m}"
  end
end

# --- My thoughts ----------
# define_singleton_method allows Objects to create individual methods.

# --- To Do 
# learn more about the &block method.