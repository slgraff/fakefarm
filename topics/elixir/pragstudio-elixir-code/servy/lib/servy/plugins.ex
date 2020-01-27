defmodule Servy.Plugins do
  alias Servy.Conv

  require Logger

  def track(%Conv{status: 404} = conv) do
    IO.puts Logger.info "My first logger message"
    conv
  end

  # Defaults are necessary when a pattern will not match
  def track(%Conv{} = conv), do: conv

  def rewrite_path( %Conv{path: "/wildlife"} = conv ) do
    %Conv{ conv | path: "/wildthings" }
  end

  def rewrite_path( %Conv{path: "/genesis?id=" <> chapter } = conv) do
    %Conv{ conv | path: "/genesis/#{chapter}"}
  end

  def rewrite_path(%Conv{} = conv), do: conv

  def log(%Conv{} = conv), do: IO.inspect conv
end
