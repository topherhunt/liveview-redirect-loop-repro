defmodule OmgWeb.PageController do
  use OmgWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def live(conn, _params) do
    live_render(conn, OmgWeb.OmgLive, session: %{})
  end
end
