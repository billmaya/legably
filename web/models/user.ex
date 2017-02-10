defmodule Legably.User do
  use Legably.Web, :model

  # Primary key automatically defined; defaults to :id

  schema "users" do
    field :lawyer, :boolean, null: true
    field :firm, :boolean, null: true
    field :first_name, :string, null: false
    field :last_name, :string, null: false
    field :email, :string, null: false
    field :password, :string, virtual: true
    field :password_hash, :string, null: false
    field :bar_id, :string, null: true
    field :bar_state, :string, null: true
    field :phone, :string, null: true
    field :firm_name, :string, null: true
    field :area_of_focus, :string, null: true
    field :street_address_1, :string, null: true
    field :street_address_2, :string, null: true
    field :city, :string, null: true
    field :state, :string, null: true
    field :zip, :string, null: true
  end

  def changeset(model, params \\ :empty) do
    model
  end

end
