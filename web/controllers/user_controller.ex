defmodule Legably.UserController do
  use Legably.Web, :controller

  def index(conn, _params) do
    users = Repo.all(Legably.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Legably.User, id)
    render conn, "show.html", user: user
  end

end
