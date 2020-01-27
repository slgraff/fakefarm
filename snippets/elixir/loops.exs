defmodule Boom do
  def convert([head|tail]) do
    IO.inspect(String.downcase(head))
    convert(tail)
  end

  def convert([]), do: []
end

Boom.convert(["A", "B", "C"])
|> IO.inspect