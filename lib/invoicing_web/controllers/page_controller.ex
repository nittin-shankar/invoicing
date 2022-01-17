defmodule InvoicingWeb.PageController do
  use InvoicingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
