
# colors = %{color: "red", brand: "new"}
# for rank <- ranks, suit <- suits, {color, value} <- colors, do: {rank, suit, %{value => color}}

# Exercise from
# https://online.pragmaticstudio.com/courses/elixir/steps/33
ranks = [ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" ]
suits = [ "♣", "♦", "♥", "♠" ]
deck = for rank <- ranks, suit <- suits, do: {rank, suit}
IO.inspect(deck)

deck
|> Enum.shuffle
|> Enum.take(13)
|> IO.inspect


deck
|> Enum.shuffle
|> Enum.chunk_every(13)
|> IO.inspect