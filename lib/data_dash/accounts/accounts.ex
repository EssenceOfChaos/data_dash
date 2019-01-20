defmodule DataDash.Accounts do
  @moduledoc """
    The Accounts context.
  """

  import Ecto.Query, warn: false
  alias DataDash.Repo

  alias DataDash.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def find_or_add(attrs = %{id: id, avatar: avatar, display_name: display_name}) do
    IO.puts("**~~ what are the attrs passed to find_or_add !?!?!?!? ~~**")
    IO.inspect(attrs)
    # Repo.get_by(User, auth_id: id)
    case check_for_user(id) do
      %DataDash.Accounts.User{auth_id: id} -> IO.puts("***~~~ User exists in DB ~~~***")
      _ -> User.changeset(%User{auth_id: id, avatar: avatar, display_name: display_name}, attrs) |> Repo.insert()
    end
  end

## Private ##

  defp check_for_user(id) do
    user =
      from(u in User)
      |> where([u], u.auth_id == ^id)
      |> Repo.one()
  end

end
