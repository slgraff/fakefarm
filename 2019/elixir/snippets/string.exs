#  Working with functions

request = """
GET /wildthings HTTP1/1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

# String.split(request, "\n")

IO.puts(String.split(request, "\n"))

IO.puts request |> String.split("\n") |> List.first

# > ["GET /wildthings HTTP1/1", "Host: example.com",
#  "User-Agent: ExampleBrowser/1.0", "Accept: */*", "", ""]


conv = %{ method: "GET", path: "/wildlife" }

%{path: "/wildlife" } = conv