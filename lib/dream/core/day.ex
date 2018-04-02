defmodule Dream.Core.Day do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "days" do
    field :display_name, :string
    field :name, :string

    has_many :characters, Dream.Core.Character
    has_many :narratives, Dream.Character.Narrative

    timestamps()
  end

  @doc false
  def changeset(day, attrs) do
    day
    |> cast(attrs, [:name, :display_name])
    |> validate_required([:name, :display_name])
  end
end