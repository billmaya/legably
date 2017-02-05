defmodule Legably.AboutController do
    use Legably.Web, :controller

    def index(conn, _params) do
        render conn, "about.html"
    end
end
