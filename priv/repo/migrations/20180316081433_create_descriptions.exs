defmodule Dream.Repo.Migrations.CreateDescriptions do
  use Ecto.Migration

  def change do
    create table(:descriptions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :text, :text
      add :character_id, references(:characters, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:descriptions, [:character_id])
  end
end
