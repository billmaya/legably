defmodule Legably.User do
  use Legably.Web, :model

  # Primary key automatically defined; defaults to :id

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password_hash, :string

    timestamps
  end

end
