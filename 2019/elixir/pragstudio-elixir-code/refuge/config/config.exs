# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :refuge,
  ecto_repos: [Refuge.Repo]

# Configures the endpoint
config :refuge, RefugeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NPbL/hCJgPH6Wq3CJDAyuy2s5wnf2DO9SEghIRj/8idVk5uAAnBVh/O2IElBOlB1",
  render_errors: [view: RefugeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Refuge.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
