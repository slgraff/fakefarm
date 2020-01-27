defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  def to_rna(char) do
    List.to_string(char)
    |> String.split("")
    |> Enum.reject( &(&1 == "") )
    |> convert
    |> String.to_charlist
  end

  def convert([head | tail]) do
    case head do
      "G" -> "C"
      "C" -> "G"
      "T" -> "A"
      "A" -> "U"
    end
  end



  #

  # @spec to_rna([char]) :: [char]
  # def to_rna(dna) do
  #   divide_string(dna)
  #   |> Enum.map(dna, fn(s) -> convert(s) end)
  # end


  # def divide_string(str) do
  #   String.codepoints(str)
  # end

  # def convert(dna) do
  #   cond do
  #     dna == 'G' -> 'C'
  #     dna == 'C' -> 'G'
  #     dna == 'T' -> 'A'
  #     dna == 'A' -> 'U'
  #   end
  # end
end
