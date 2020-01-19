defmodule Shirt do
  defstruct size: "", color: "", qty: 0, price: 0

  def total(shirt) do
    shirt.price * shirt.qty
  end
end

