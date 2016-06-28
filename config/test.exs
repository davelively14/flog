use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :flog, Flog.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :flog, Flog.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "flog_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
