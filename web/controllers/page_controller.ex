defmodule Legably.PageController do
  use Legably.Web, :controller

  alias Legably.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

end
