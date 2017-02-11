defmodule Legably.User do
  use Legably.Web, :model

  # Primary key automatically defined; defaults to :id

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :bar_id, :string
    field :bar_state, :string

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(first_name last_name phone email password_hash bar_id bar_state), [])
  end

end
