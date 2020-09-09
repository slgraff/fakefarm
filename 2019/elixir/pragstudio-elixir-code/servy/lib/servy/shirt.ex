defmodule Shirt do
  defstruct size: "", color: "", qty: 0, price: 0

  def total(shirt) do
    shirt.price * shirt.qty
  end
end

defmodule Mathy do
  def sum([head | tail], total) do
    sum(tail, total + head)
  end

  def sum([], total), do: IO.puts total

  def triple([head | tail]) do
    [ head * 3 | triple(tail)]
  end

  def triple([]), do: []
end

defmodule Recurse do
  # 1. think of lists as head/tail
  #
  def my_map([head|tail], fun) do
    [fun.(head) | my_map(tail, fun)]
  end

  def my_map([], _fun), do: []
end

defmodule Mappy do
  def ca([head | tail], func) do
    [func.(head) | ca(tail, func)]
  end

  def ca([], _func), do: []
end