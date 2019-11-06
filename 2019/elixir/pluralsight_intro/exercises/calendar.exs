defmodule Sample.Calendar do
  def is_leap_year(year) when rem(year, 400) == 0, do: true
  def is_leap_year(year) when rem(year, 100) == 0, do: false
  def is_leap_year(year) when rem(year, 4) == 0, do: true
  def is_leap_year(year), do: false

  def check(thing) when is_atom(thing) do
    'boom!'
  end

  def check(thing) when is_list(thing) do
    tl(thing)
  end
end


