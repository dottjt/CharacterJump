defmodule Dream.Character.Narrative do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "narratives" do
    field :text, :string
    # field :selected, :boolean, default: false
    # field :character_id, :binary_id
    
    belongs_to :day, Dream.Core.Day

    timestamps()
  end

  @doc false
  def changeset(narrative, attrs) do
    narrative
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end

  def new_changeset(narrative, attrs) do
    narrative
    |> cast(attrs, [:text, :character_id])
    |> validate_required([:text, :character_id])
  end

end
