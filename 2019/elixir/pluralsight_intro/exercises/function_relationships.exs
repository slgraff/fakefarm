defmodule Funky do
  def stringer(a,b) do
    piper(a,b)
    |> multiply # when you pipe in the values, you can leave off the arguments. cool!
  end

  def piper(a,b) do
    if a == 10 do
      []
    else
      [a,b]
    end
  end

  def multiply([]) do
    '10 * b'
  end

  def multiply([a,b]) do
    a * b
  end

    def foo(10) do
    'i am 10'
  end

  def foo(:a) do
    'i am another function'
  end

  def foo(two) do
    cond do
      is_atom(two) -> atomize(two)
      is_number(two) -> mult(two)
    end
  end

  def atomize(a) do
    'i am an atom!'
  end

  def mult(n) do
    n * n
  end
end

