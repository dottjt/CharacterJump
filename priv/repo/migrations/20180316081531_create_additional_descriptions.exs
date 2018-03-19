defmodule Dream.Repo.Migrations.CreateAdditionalDescriptions do
  use Ecto.Migration

  def change do
    create table(:additional_descriptions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :display_name, :string
      add :text, :text
      add :character_id, references(:characters, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:additional_descriptions, [:character_id])
  end
end
