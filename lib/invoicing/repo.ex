defmodule Invoicing.Repo do
  use Ecto.Repo,
    otp_app: :invoicing,
    adapter: Ecto.Adapters.Postgres
end
