defmodule Dream.Trait.TraitCategory do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "trait_categories" do
    field :display_name, :string
    field :name, :string
    # field :trait_id, :binary_id

    belongs_to :trait, Dream.Character.Trait 

    timestamps()
  end

  @doc false
  def changeset(trait_category, attrs) do
    trait_category
    |> cast(attrs, [:name, :display_name])
    |> validate_required([:name, :display_name])
  end
end
