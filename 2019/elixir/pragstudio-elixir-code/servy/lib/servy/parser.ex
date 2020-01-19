defmodule Servy.Parser do


  # Add an alias using as,
  # alias Servy.Conv, as: Conv

  # is same as just letting alias
  # be the last item in 'dot' chain - 'Conv'
  alias Servy.Conv

  def parse(request) do
    [method, path, _] =
    request
    |> String.split("\n")
    |> List.first
    |> String.split(" ")

    %Conv{ method: method,
      path: path
    }
  end
end