defmodule Dream.Repo.Migrations.CreateTraitCategories do
  use Ecto.Migration

  def change do
    create table(:trait_categories, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :display_name, :string

      add :trait_id, references(:traits, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:trait_categories, [:trait_id])
  end
end
