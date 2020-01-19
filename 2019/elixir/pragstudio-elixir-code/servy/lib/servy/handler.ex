defmodule Servy.Handler do
  @moduledoc "This is module wide documentation"

  @pages_page Path.expand("../../pages", __DIR__)

  # import will import other modules.
  # running a file by itself will not load them
  # but running as a mix project (iex -S mix)
  # will load all necessary modules.

  import Servy.Plugins, only: [rewrite_path: 1, log: 1, track: 1]

  import Servy.Parser, only: [parse: 1]
  import Servy.File, only: [handle_file: 2]

  def handle(request) do
    request
    |> parse
    |> rewrite_path
    |> log
    |> route
    |> track
    |> emojify
    |> format_response
  end

  def emojify(%{status: 200 } = conv) do
    rb = "👋👋👋\n#{conv.resp_body}\n🤙🤙🤙"
    %{ conv | resp_body: rb }
  end

  def emojify(conv), do: conv

  def route(%{method: "GET", path: "/wildthings"} = conv) do
    %{ conv | resp_body: "Waiting in the Wilderness", status: 200 }
  end

  def route(%{method: "GET", path: "/bears"} = conv) do
    %{ conv | resp_body: "Literacy is the foundation", status: 200 }
  end

  def route(%{method: "GET", path: "/bears/new"} = conv) do
    @pages_page
    |> Path.join("form.html")
    |> File.read
    |> handle_file(conv)
  end

  def route(%{method: "GET", path: "/about"} = conv) do
    @pages_page
    |> Path.join("about.html")
    |> File.read
    |> handle_file(conv)
  end

  # def route(%{method: "GET", path: "/pages" <> page } = conv) do
  def route(%{method: "GET", path: "/pages" <> page } = conv) do
    @pages_page
    |> Path.join("#{page}.html")
    |> File.read
    |> handle_file(conv)
  end

  # route function using case statement approach instead of a multi-clause approach above.

  # def route(%{method: "GET", path: "/about"} = conv) do
  #   file =
  #     Path.expand("../../pages/", __DIR__)
  #     |> Path.join("about.html")

      # case File.read(file) do
      #   {:ok, contents } ->
      #     %{ conv | resp_body: contents, status: 200 }
      #   {:error, :enoent } ->
      #     %{ conv | resp_body: "File Not found", status: 404 }
      #   {:error, reason } ->
      #     %{ conv | resp_body: reason, status: 500 }
      # end
  # end

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

# request = """
# GET /bears/new HTTP/1.1
# Host: example.com
# User-Agent: ExampleBrowser/1.0
# Accept: */*

# """

# response = Servy.Handler.handle(request)
# IO.puts response


# request = """
# GET /genesis?id=1 HTTP/1.1
# Host: example.com
# User-Agent: ExampleBrowser/1.0
# Accept: */*

# """


# response = Servy.Handler.handle(request)
# IO.puts response

# request = """
# GET /wildthings HTTP1/1
# Host: example.com
# User-Agent: ExampleBrowser/1.0
# Accept: */*

# """


# response = Servy.Handler.handle(request)
# IO.puts response

# request = """
# GET /bears HTTP1/1
# Host: example.com
# User-Agent: ExampleBrowser/1.0
# Accept: */*

# """


# response = Servy.Handler.handle(request)
# IO.puts response

# request = """
# GET /zion HTTP1/1
# Host: example.com
# User-Agent: ExampleBrowser/1.0
# Accept: */*

# """


# response = Servy.Handler.handle(request)
# IO.puts response

# request = """
# GET /genesis/1 HTTP1/1
# Host: example.com
# User-Agent: ExampleBrowser/1.0
# Accept: */*

# """


# response = Servy.Handler.handle(request)
# IO.puts response

# request = """
# DELETE /genesis/1 HTTP/1.1
# Host: example.com
# User-Agent: ExampleBrowser/1.0
# Accept: */*

# """


# response = Servy.Handler.handle(request)
# IO.puts response

# request = """
# GET /wildlife HTTP/1.1
# Host: example.com
# User-Agent: ExampleBrowser/1.0
# Accept: */*

# """


# response = Servy.Handler.handle(request)
# IO.puts response


# response = Servy.Handler.handle(request)
# IO.puts response

# request = """
# GET /about HTTP/1.1
# Host: example.com
# User-Agent: ExampleBrowser/1.0
# Accept: */*

# """


# response = Servy.Handler.handle(request)
# IO.puts response


request = """
GET /pages/genesis HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""


response = Servy.Handler.handle(request)
IO.puts response

