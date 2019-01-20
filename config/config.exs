# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :data_dash,
  ecto_repos: [DataDash.Repo]

# Configures the endpoint
config :data_dash, DataDashWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "51vMm/bYCCxo0RQdNC9JFvOJ/s3pdamWuQviRcBGRGjlJSwhUje0285VCN//aI+9",
  render_errors: [view: DataDashWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DataDash.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Ueberauth
config :ueberauth, Ueberauth,
  providers: [
    auth0: {Ueberauth.Strategy.Auth0, []}
  ]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


# Configures Ueberauth's Auth0 auth provider
config :ueberauth, Ueberauth.Strategy.Auth0.OAuth,
  domain: System.get_env("AUTH0_DOMAIN"),
  client_id: System.get_env("AUTH0_CLIENT_ID"),
  client_secret: System.get_env("AUTH0_CLIENT_SECRET")

# Configures Guardian
config :data_dash, DataDash.Accounts.Guardian,
       issuer: "data_dash",
       secret_key: System.get_env("GUARDIAN_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
