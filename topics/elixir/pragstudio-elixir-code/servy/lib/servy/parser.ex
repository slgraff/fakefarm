defmodule Servy.Parser do


  # Add an alias using as,
  # alias Servy.Conv, as: Conv

  # is same as just letting alias
  # be the last item in 'dot' chain - 'Conv'
  alias Servy.Conv

  def parse(request) do
    [top, params_string] = String.split(request, "\n\n")

    [request_line | header_lines ] = String.split(top, "\n")

    [method, path, _] = String.split(request_line, " ")

    headers = parse_headers(header_lines)

    params = parse_params(headers["Content-Type"],  params_string)

    %Conv{ method: method,
      path: path,
      params: params,
      headers: headers
    }
  end

  # def parse_headers([ head | tail ]) do
  #   [key, value] = String.split(head, ": ")
  #   headers = Map.put(headers, key, value)
  #   parse_headers(tail, headers)
  # end

  # def parse_headers(header_lines) do
  #   Enum.reduce(header_lines, %{}, fn(line, headers_so_far) ->
  #     [key, value] = String.split(line, ": ")
  #     Map.put(headers_so_far, key, value)
  #   end)
  # end

  def parse_headers(header_lines) do
    Enum.reduce(header_lines, %{}, fn(line, headers_so_far) ->
      [key, value] = String.split(line, ": ")
      Map.put(headers_so_far, key, value)
    end)
  end

  def parse_headers(headers), do: headers

  @doc """
    Parses the given param of the form `key1=value1&key2=value2`

    ## Examples
      iex> params_string = "name=Fake&type=Farm"
      iex> Servy.Parser.parse_params("application/x-www-form-urlencoded", params_string)
      %{"name"=>"Fake", "type"=> "Farm"}
  """

  def parse_params("application/x-www-form-urlencoded", params_string) do
    params_string |> String.trim |> URI.decode_query
  end

  def parse_params(_, _), do: %{}
end