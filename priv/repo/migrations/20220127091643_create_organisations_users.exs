defmodule Invoicing.Repo.Migrations.CreateOrganisationsUsers do
  use Ecto.Migration

  def change do
    create table("organisations_users", primary_key: false) do
      add :organisation_id, references(:organisations, type: :uuid)
      add :user_id, references(:users, type: :uuid)
    end
  end
end
