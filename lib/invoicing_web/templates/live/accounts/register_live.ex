defmodule InvoicingWeb.Accounts.RegisterLive do
  use InvoicingWeb, :live_view
  alias Invoicing.Accounts.Registration

  def mount(_params, _session, socket) do
    changeset = Registration.changeset(%Registration{}, %{})

    {:ok, assign(socket, :changeset, changeset)}
  end
end