defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  def to_rna(char) do
    stringify_codepoint(char)
    |> make_conversion
    |> codepoint_string
  end

  def stringify_codepoint(char) do
    List.to_string(char)
    |> String.split("")
    |> Enum.reject( &(&1 == "") )
  end

  def make_conversion(code) do
    Enum.map(code, fn(c) -> convert(c) end)
    |> List.to_string
  end

  def convert(head) do
    case head do
      "G" -> "C"
      "C" -> "G"
      "T" -> "A"
      "A" -> "U"
    end
  end

  def codepoint_string(char) do
    String.to_charlist(char)
  end
end
