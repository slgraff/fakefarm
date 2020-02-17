defmodule TweetApp.FileReader do
  def get_strings_to_tweet(path) do
    File.read!(path)
    |> prep_string
  end

  def prep_string(path) do
    path
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&String.length(&1) < 140)
    |> Enum.random()
  end

  def oh_dude(string) do
    Enum.map(&String.trim/1)
  end
end