class Calculator
  def initialize(val1, val2)
    @val1 = val1
    @val2 = val2
  end

  def add
    @val1 + @val2
  end

  def subtract
    @val1 - @val2
  end
end

cal = Calculator.new(20,11)
puts cal.add
puts cal.subtract