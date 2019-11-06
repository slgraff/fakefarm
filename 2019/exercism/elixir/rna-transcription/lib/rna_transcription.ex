defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    divide_string(dna)
    |> Enum.map(dna, fn(s) -> convert(s) end)
  end


  def divide_string(str) do
    String.codepoints(str)
  end

  def convert(dna) do
    cond do
      dna == 'G' -> 'C'
      dna == 'C' -> 'G'
      dna == 'T' -> 'A'
      dna == 'A' -> 'U'
    end
  end
end
