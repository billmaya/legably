defmodule Legably.SessionController do
  use Legably.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => email, "password" => pass}}) do
    case Legably.Auth.login_by_email_and_pass(conn, email, pass, repo: Repo) do
      {:ok, conn} ->
        conn
        #|> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :new))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid email/password combination!")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Legably.Auth.logout()
    |> redirect(to: page_path(conn, :new))
  end

end
