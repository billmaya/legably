defmodule Legably.Repo.Migrations.AddRemainingFirmFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :area_of_focus, :string
      add :street_address_1, :string
      add :street_address_2, :string
      add :city, :string
      add :state, :string
      add :zip, :string
    end
  end
end
