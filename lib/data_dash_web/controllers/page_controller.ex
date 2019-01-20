defmodule DataDashWeb.PageController do
  use DataDashWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
