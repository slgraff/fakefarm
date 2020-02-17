defmodule Servy.Wildthings do
  alias Servy.Bear

  def get_bear(id) when is_integer(id) do
    Enum.find(list_bears(), fn(b) -> b.id == id end)
  end

  def get_bear(id) when is_binary(id) do # strings are 'binary'
    id |> String.to_integer |> get_bear
  end

  def list_bears do
    [
      %Bear{id: 1, name: "Yogi", type: "Brown", hibernating: true},
      %Bear{id: 2, name: "Yanni", type: "Brown", hibernating: true},
      %Bear{id: 3, name: "Larry the lobster", type: "fake bear", hibernating: false},
      %Bear{id: 4, name: "Brogi", type: "Brown", hibernating: true},
      %Bear{id: 5, name: "Barry the bald bear", type: "balk", hibernating: false},
    ]
  end
end