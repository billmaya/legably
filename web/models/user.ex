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

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(first_name last_name email password_hash), [])
  end

end
