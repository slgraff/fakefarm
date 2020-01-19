defmodule Servy.Plugins do
  require Logger
  def track(%{status: 404} = conv) do
    IO.puts Logger.info "My first logger message"
    conv
  end

  # Defaults are necessary when a pattern will not match
  def track(conv), do: conv

  def rewrite_path( %{path: "/wildlife"} = conv ) do
    %{ conv | path: "/wildthings" }
  end

  def rewrite_path( %{path: "/genesis?id=" <> chapter } = conv) do
    %{ conv | path: "/genesis/#{chapter}"}
  end

  def rewrite_path(conv), do: conv

  def log(conv), do: IO.inspect conv
end
