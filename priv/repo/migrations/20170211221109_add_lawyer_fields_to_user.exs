defmodule Legably.Repo.Migrations.AddLawyerFieldsToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :phone, :string
      add :bar_id, :string
      add :bar_state, :string

    end
  end

end
