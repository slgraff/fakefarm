# Extending an Object
# Modules can be mixed into objects at run time using the #extend([MODULE]) method
# This is helpful when a Class has a few different messages
# with similar functionality, yet some variance.

# This approach is similar to Inheritance,
# But the advantage is if the 'Public' Class needs to
# manage behavior from multiple locations.
# Rather than


class RainbowMaker
  def blue(color)
    # Rainbow will know of both the color,
    # and the options that influence the rainbow
    Color.new.extend(Blue).rainbow(color)
  end

  def red(color)
    # Using #extend introduces code at run time.
    Color.new.extend(Red).rainbow(color)
  end
end

# The Color Class consolidates common functionality
# which the modules will take advantage of

class Color
  def rainbow(color)
    # Per Refactoring: Template Method,
    # the unique Modules should have a common method name
    # which is called by the common class.
    puts "I am a rainbow"
    value(color)
    puts "\n"
  end
end

module Blue
  def value(color)
    puts "i am #{color}"
  end
end

module Red
  def value(color)
    puts "i am #{color}"
  end
end

r = RainbowMaker.new.red("burgundy")
b = RainbowMaker.new.blue("azul!")


