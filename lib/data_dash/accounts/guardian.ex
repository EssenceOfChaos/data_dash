defmodule DataDash.Accounts.Guardian do
  @moduledoc """
  Used by Guardian to serialize JWT token
  """
  use Guardian, otp_app: :data_dash

  alias DataDash.{Repo, Accounts.User}

  def subject_for_token(%User{} = user, _claims), do: {:ok, "User:#{user.auth_id}"}
  def subject_for_token(_, _), do: {:error, :reason_for_error}

  def resource_from_claims("User:" <> id), do: {:ok, Repo.get_by(User, auth_id: id)}
  def resource_from_claims(_claims), do: {:error, :reason_for_error}

end
