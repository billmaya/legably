# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :legably,
  ecto_repos: [Legably.Repo]

# Configures the endpoint
config :legably, Legably.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bAeKXl2fz6YToF0XFCzWalH3Ll1YC7x2fcU3YZ3XegkXQuKM6g08aZHgHRKrc+Pt",
  render_errors: [view: Legably.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Legably.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
