defmodule Servy.Handler do
  def handle(request) do
    request
    |> parse
    |> rewrite_path
    |> log
    |> route
    |> track
    |> format_response
  end

  def track(%{status: 404, path: path} = conv) do
    IO.puts "Warning: #{path} is on the loose!"
    conv
  end

  # Defaults are necessary when a pattern will not match
  def track(conv), do: conv

  def parse(request) do
    [method, path, _] =
      request
      |> String.split("\n")
      |> List.first
      |> String.split(" ")

    %{ method: method,
       path: path,
       resp_body: "",
       status: nil
      }
  end


  def rewrite_path( %{path: "/wildlife"} = conv ) do
    %{ conv | path: "/wildthings" }
  end

  def rewrite_path(conv), do: conv

  def log(conv), do: IO.inspect conv


  # def route(conv) do
  #   route(conv, conv.method, conv.path)
  # end

  def route(%{method: "GET", path: "/wildthings"} = conv) do
      %{ conv | resp_body: "Waiting in the Wilderness", status: 200 }
  end

  def route(%{method: "GET", path: "/bears"} = conv) do
      %{ conv | resp_body: "Literacy is the foundation", status: 200 }
  end

  def route(%{method: "GET", path: "/genesis" <> chapter} = conv) do
    %{ conv | status: 200, resp_body: "Genesis #{chapter}, a great place to begin."}
  end

  def route(%{method: "DELETE", path: "/genesis" <> chapter} = conv) do
    %{ conv | status: 403, resp_body: "Genesis #{chapter}, is your loss"}
  end

  # catch all - whatever the path is, is not intended,
  # and so we assign it to variable from conv.
  def route(%{ path: path } = conv) do
    %{ conv | resp_body: "No #{path} here!", status: 404 }
  end


  def format_response(conv) do
    """
    HTTP/1.1 #{conv.status} #{status_response(conv.status)}
    Content-Type: text/html
    Content-Length: #{String.length(conv.resp_body)}

    #{conv.resp_body}
    """
  end

  defp status_response(code) do
    %{
      200 => "OK",
      201 => "Created",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not Found",
      500 => "Internal Server Error"
    }[code]
  end

end

request = """
GET /wildthings HTTP1/1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""


response = Servy.Handler.handle(request)
IO.puts response

request = """
GET /bears HTTP1/1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""


response = Servy.Handler.handle(request)
IO.puts response

request = """
GET /zion HTTP1/1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""


response = Servy.Handler.handle(request)
IO.puts response

request = """
GET /genesis/1 HTTP1/1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""


response = Servy.Handler.handle(request)
IO.puts response

request = """
DELETE /genesis/1 HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""


response = Servy.Handler.handle(request)
IO.puts response

request = """
GET /wildlife HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""


response = Servy.Handler.handle(request)
IO.puts response