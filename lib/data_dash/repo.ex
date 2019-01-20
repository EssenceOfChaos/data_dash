defmodule DataDash.Repo do
  use Ecto.Repo,
    otp_app: :data_dash,
    adapter: Ecto.Adapters.Postgres
end
