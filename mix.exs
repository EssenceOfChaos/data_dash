defmodule DataDash.MixProject do
  @moduledoc """
    Application Configuration && Dependency Declaration
  """
  use Mix.Project

  def project do
    [
      app: :data_dash,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {DataDash.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.0"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      ## Added Deps ##
      {:amqp, "~> 0.2.3"}, # Cloud RabbitMQ Client
      {:guardian, "~> 1.0"},
      {:ueberauth, "~> 0.5"},
      {:ueberauth_auth0, "~> 0.3"},
      {:httpoison, "~> 1.0"},
      {:benchee, "~> 0.13", only: :dev},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false}

    ]
  end


  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"],
      "ecto.migrate": ["ecto.migrate", "ecto.dump"] # view schema after migrations
    ]
  end
end
