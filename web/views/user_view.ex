defmodule Legably.UserView do
  use Legably.Web, :view
  alias Legably.User

  def fullname(%User{first_name: first, last_name: last}) do
    Enum.join([first, last], " ")
  end
end
