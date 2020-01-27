defmodule Boom do
  def convert([head|tail]) do
    IO.inspect(head)
    convert(tail)
  end

  def convert([]), do: []
end