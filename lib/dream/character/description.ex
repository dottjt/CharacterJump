defmodule Dream.Character.Description do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "descriptions" do
    field :text, :string
    # field :character_id, :binary_id

    belongs_to :character, Dream.Core.Character

    timestamps()
  end

  @doc false
  def changeset(description, attrs) do
    description
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
