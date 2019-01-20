defmodule DataDash.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :auth_id, :string
      add :avatar, :string
      add :display_name, :string
      add :email, :string
      add :preferences, {:array, :string}

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
