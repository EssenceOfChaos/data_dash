defmodule DataDash.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :auth_id, :string
    field :avatar, :string
    field :display_name, :string
    field :email, :string
    field :preferences, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:auth_id, :avatar, :display_name, :email, :preferences])
    |> validate_required([:auth_id, :avatar, :display_name, :email, :preferences])
    |> unique_constraint(:email)
  end
end
