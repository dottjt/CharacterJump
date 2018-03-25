defmodule Dream.Character.Trait do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "traits" do
    field :name, :string
    field :display_name, :string
    field :category, :string
    field :selected, :boolean, default: false

    # field :character_id, :binary_id
    belongs_to :character, Dream.Core.Character

    timestamps()
  end

  @doc false
  def changeset(trait, attrs) do
    trait
    |> cast(attrs, [:name, :display_name, :selected, :category])
    |> validate_required([:name, :display_name, :selected, :category])
  end

  def new_changeset(trait, attrs) do
    trait
    |> cast(attrs, [:name, :display_name, :selected, :category, :character_id])
    |> validate_required([:name, :display_name, :selected, :category, :character_id])
  end

end
