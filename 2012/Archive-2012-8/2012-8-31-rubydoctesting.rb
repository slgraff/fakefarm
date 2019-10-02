# Practice with rubydoctest

=begin

doctest: Calling class on itself will return a rectangle
>> r = Rectangle.new(23.45, 34.67)
>> r.class 
=> Rectangle

doctest: Buildng an area method
>> r.area
=> 813.0115000000001

doctest: Building a perimeter method
>> r.perimeter
=> 116.24000000000001


=end

class Rectangle

  def initialize(length, height)
    @length, @height = length, height
    @area = @length * @height
    @perimeter = 
  end

  def area
    @length * @height
  end

  def perimeter
    (@length + @height) * 2
  end

end

