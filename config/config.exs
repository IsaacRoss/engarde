# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :engarde,
  ecto_repos: [Engarde.Repo]

# Configures the endpoint
config :engarde, EngardeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jZcOoEM+Tps28k5Fgn17Sz7CdsIW4PSqJNjJ17Ao52WoWmnF0Gw2X+xInQJ+nRSG",
  render_errors: [view: EngardeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Engarde.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
