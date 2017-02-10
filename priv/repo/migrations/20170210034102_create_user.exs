defmodule Legably.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :lawyer, :boolean
      add :firm, :boolean
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :password_hash, :string
      add :bar_id, :string
      add :bar_state, :string
      add :phone, :string
      add :firm_name, :string
      add :area_of_focus, :string
      add :street_address_1, :string
      add :street_address_2, :string
      add :city, :string
      add :state, :string
      add :zip, :string

      timestamps
    end

    create unique_index(:users, [:email])
  end
  
end
