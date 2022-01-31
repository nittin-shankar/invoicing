defmodule Invoicing.Accounts.Registration do
  @moduledoc """
  Embedded schema for registration
  """
  use Ecto.Schema
  import Ecto.Changeset

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
  end
end