defmodule Legably.LoginController do
    use Legably.Web, :controller

    def index(conn, _params) do
        render conn, "login.html"
    end
end
