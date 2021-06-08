defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())

  # 2nd MOST STARRED

  def commands(code) do
    Integer.digits(code, 2)
    |> Enum.reverse
    |> Enum.with_index
    |> Enum.reduce([], &append/2)
    |> Enum.reverse
  end

  defp append({0, _}, acc), do: acc
  defp append({_, 0}, acc), do: ["wink" | acc]
  defp append({_, 1}, acc), do: ["double blink" | acc]
  defp append({_, 2}, acc), do: ["close your eyes" | acc]
  defp append({_, 3}, acc), do: ["jump" | acc]
  defp append({_, 4}, acc), do: Enum.reverse(acc)
  defp append({_, _}, acc), do: acc



  # MOST STARRED

  # def commands(code) when code <= 0 or code >= 32 do
  #   []
  # end

  # def commands(code) when code >= 16 and code < 32 do
  #   Enum.reverse commands(code - 16)
  # end

  # def commands(code) when code >= 1 and code < 16 do
  #   di = Enum.reverse(Integer.digits code, 2)
  #   zc = Enum.zip Enum.take([1,2,4,8], length(di)), di

  #   zc
  #     |> Enum.filter(&elem(&1, 1) == 1)
  #     |> Enum.map(&elem(&1, 0))
  #     |> Enum.map(&command(&1))
  # end

  # defp command(code) do
  #   case code do
  #     1 -> "wink"
  #     2 -> "double blink"
  #     4 -> "close your eyes"
  #     8 -> "jump"
  #   end
  # end

  # SHAMELESS GREEN

  # def commands(1) do
  #   ["wink"]
  # end

  # def commands(2) do
  #   ["double blink"]
  # end

  # def commands(4) do
  #   ["close your eyes"]
  # end

  # def commands(8) do
  #   ["jump"]
  # end

  # def commands(3) do
  #   ["wink", "double blink"]
  # end

  # def commands(19) do
  #    ["double blink", "wink"]
  # end

  # def commands(24) do
  #    ["jump"]
  # end

  # def commands(16) do
  #    []
  # end

  # def commands(15) do
  #    ["wink", "double blink", "close your eyes", "jump"]
  # end

  # def commands(31) do
  #    ["jump", "close your eyes", "double blink", "wink"]
  # end

  # def commands(0) do
  #    []
  # end

  # def commands(32) do
  #    []
  # end
end
