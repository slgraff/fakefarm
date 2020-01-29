defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()

  def count(strand, nucleotide) do
    Enum.reduce(strand, 0, fn x, acc -> acc + check(x, nucleotide) end)
  end

  # defp compare()

  def check(strand, compare) do
    cond do
      strand == compare -> 1
      strand != compare -> 0
    end
  end

  def split([head|tail], nucleotide) do
    head == nucleotide
  end

  def split([]), do: []

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
  end
end
