defmodule Servy.Bear do
  defstruct id: nil, name: "", type: "", hibernating: false

  def is_not_brown(bear) do
    bear.type != "Brown"
  end

  def order_by_name(b1,b2) do
    b1.name <= b2.name
  end
end