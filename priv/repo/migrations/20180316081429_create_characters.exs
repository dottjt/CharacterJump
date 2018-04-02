defmodule Dream.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :secondary_id, :string
      add :name, :string
      add :display_name, :string
      add :featured_image, :string
      add :icon, :string
      add :selected, :boolean
      
      add :day_id, references(:days, on_delete: :nothing, type: :binary_id)
      add :journal_id, references(:journals, on_delete: :nothing, type: :binary_id)
      add :narrative_id, references(:narratives, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:characters, [:day_id])
  end
end
