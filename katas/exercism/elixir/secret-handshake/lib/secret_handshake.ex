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

  def commands(1) do
    ["wink"]
  end

  def commands(2) do
    ["double blink"]
  end

  def commands(4) do
    ["close your eyes"]
  end

  def commands(8) do
    ["jump"]
  end

  def commands(3) do
    ["wink", "double blink"]
  end

  def commands(19) do
     ["double blink", "wink"]
  end

  def commands(24) do
     ["jump"]
  end

  def commands(16) do
     []
  end

  def commands(15) do
     ["wink", "double blink", "close your eyes", "jump"]
  end

  def commands(31) do
     ["jump", "close your eyes", "double blink", "wink"]
  end

  def commands(0) do
     []
  end

  def commands(32) do
     []
  end
end
