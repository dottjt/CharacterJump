defmodule Dream.Repo.Migrations.CreateDays do
  use Ecto.Migration

  def change do
    create table(:days, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :display_name, :string

      # add :day_id, references(:days, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

  end
end
