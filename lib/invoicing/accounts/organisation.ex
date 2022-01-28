defmodule Invoicing.Accounts.Organisation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "organisations" do
    field :name, :string
    many_to_many :users, Invoicing.Accounts.User, join_through: "organisations_users"

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
