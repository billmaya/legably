defmodule Legably.Repo.Migrations.AddLawyerFirmBooleans do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :lawyer, :boolean
      add :firm, :boolean
    end
  end
end
