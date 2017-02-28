defmodule Legably.Repo.Migrations.AddLawyerFirmBooleans do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :type, :string
    end
  end
end
