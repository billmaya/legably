defmodule Legably.User do
  use Legably.Web, :model

  # Primary key automatically defined; defaults to :id

  schema "users" do
    field :type, :string
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :bar_id, :string
    field :bar_state, :string
    field :firm_name, :string
    field :area_of_focus, :string
    field :street_address_1, :string
    field :street_address_2, :string
    field :city, :string
    field :state, :string
    field :zip, :string

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, [:first_name, :last_name, :phone, :email, :password, :bar_id, :bar_state,
                     :firm_name, :area_of_focus, :street_address_1, :street_address_2,
                     :city, :state, :zip, :type])
    |> validate_required([:first_name, :last_name, :email, :password])
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end

end
