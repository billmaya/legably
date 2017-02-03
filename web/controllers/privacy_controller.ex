defmodule Legably.PrivacyController do
    use Legably.Web, :controller

    def index(conn, _params) do
        render conn, "privacy.html"
    end
end
