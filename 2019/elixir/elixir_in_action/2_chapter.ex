defmodule Geometry do
  def rectangle_area(a,b) do
    a * b
  end

  def square_area(a) do
    rectangle_area(a,a)
  end
end

# single line and function arity
defmodule Rectangle do
  def area(a), do: area(a,a)
  def area(a,b), do: a*b
end



