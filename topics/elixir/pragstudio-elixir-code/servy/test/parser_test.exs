defmodule ParserTest do
  use ExUnit.Case
  doctest Servy.Parser

  alias Servy.Parser

  test "parses a list of headers fields into a map" do
    header_lines = ["A: 1", "B: 2"]
    headers = Parser.parse_headers(header_lines)
    assert headers == %{"A" => "1", "B" => "2"}
  end

  # test "the first request" do
  #   request = """
  #     DELETE /bears/1 HTTP/1.1
  #     Host: example.com
  #     User-Agent: ExampleBrowser/1.0
  #     Accept: */*
  #   """

  #   response = Servy.Handler.handle(request)
  #   # assert
  # end
end
