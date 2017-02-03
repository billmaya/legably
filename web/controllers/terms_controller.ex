defmodule Legably.TermsController do
  use Legably.Web, :controller

  def show(conn, _params) do
    render conn, "terms.html"
  end

end
