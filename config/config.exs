# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :omg,
  ecto_repos: [Omg.Repo]

# Configures the endpoint
config :omg, OmgWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3p76Nklj0F0ZrDxQPrQyRYoGdD/cpCag8W0+TWgYQR5nUcRETK9aOx28Gf8u47AT",
  render_errors: [view: OmgWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Omg.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
