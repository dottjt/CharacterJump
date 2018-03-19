defmodule Dream.Character.Journal do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "journals" do
    field :text, :string
    # field :character_id, :binary_id

    belongs_to :character, Dream.Core.Character

    timestamps()
  end

  @doc false
  def changeset(journal, attrs) do
    journal
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
