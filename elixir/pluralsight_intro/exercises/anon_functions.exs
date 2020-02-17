list = [1,2,3,4]
Enum.map(list, fn(x) -> x*x end)
Enum.reduce(list, 0, fn(x, acc) -> acc + x end)

Enum.map(list, &(&1 * &1))
Enum.reduce(list, 0, &(&1 + &2))

