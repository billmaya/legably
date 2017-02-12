defmodule Legably.Repo.Migrations.AddFirmNameToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :firm_name, :string
    end
  end

end
