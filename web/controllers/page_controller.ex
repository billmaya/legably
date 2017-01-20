defmodule Legably.PageController do
  use Legably.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
