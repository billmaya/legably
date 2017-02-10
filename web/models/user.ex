defmodule Legably.User do
  use Legably.Web, :model

  # Primary key automatically defined; defaults to :id

  schema "users" do
    field :lawyer, :boolean
    field :firm, :boolean
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :bar_id, :string
    field :bar_state, :string
    field :phone, :string
    field :firm_name, :string
    field :area_of_focus, :string
    field :street_address_1, :string
    field :street_address_2, :string
    field :city, :string
    field :state, :string
    field :zip, :string
  end

  def changeset(model, params \\ :empty) do
    model
  end

end
