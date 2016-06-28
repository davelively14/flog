# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :flog,
  ecto_repos: [Flog.Repo]

# Configures the endpoint
config :flog, Flog.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hnThAVYzPZXy/47leJtiyHC749HPa4Tz1l8aV5ibD1sDkMSpDwHqZLYdGfnZBmr5",
  render_errors: [view: Flog.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Flog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
