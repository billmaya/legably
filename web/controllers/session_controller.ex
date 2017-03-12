defmodule Legably.SessionController do
  use Legably.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email_address" => email_address, "password" => password}}) do
    case Legably.Auth.login_by_email_and_password(conn, email_address, password, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid email/password combination!")
        |> render("new.html")
    end
  end

end
