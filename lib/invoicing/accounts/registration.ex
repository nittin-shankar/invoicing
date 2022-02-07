defmodule Invoicing.Accounts.Registration do
  @moduledoc """
  Embedded schema for registration
  """
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Invoicing.Accounts.User

  embedded_schema do
    field :organisation_name, :string
    field :full_name, :string
    field :email, :string
    field :password, :string
  end

  def changeset(registration, attrs \\ %{}) do
    registration
    |> cast(attrs, [:organisation_name, :full_name, :email, :password])
    |> validate_required([:organisation_name, :full_name, :email, :password])
    |> validate_email()
    |> validate_password()
  end

  def validate_email(changeset) do
    changeset
    |> validate_required([:email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have @sign and no spaces")
    |> validate_length(:email, max: 160)
    |> unsafe_validate_unique(:email, Invoicing.Repo, query: from(u in User))
  end

  defp validate_password(changeset) do
    changeset
    |> validate_required([:password])
    |> validate_length(:password, min: 12, max: 72)
  end
end
