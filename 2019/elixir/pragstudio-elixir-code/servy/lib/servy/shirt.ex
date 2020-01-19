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