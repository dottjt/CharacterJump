defmodule Dream.Core.Character do
  use Ecto.Schema
  import Ecto.Changeset

  alias Dream.Helper

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "characters" do
    field :name, :string
    field :display_name, :string
    field :featured_image, :string
    field :icon, :string
    field :secondary_id, :string
    field :selected, :boolean, default: false 
    # field :day_id, :binary_id

    belongs_to :day, Dream.Core.Day

    has_many :traits, Dream.Character.Trait
    has_many :narratives, Dream.Character.Narrative    
    has_many :journals, Dream.Character.Journal
    has_many :additional_descriptions, Dream.Character.AdditionalDescription
    
    has_one :description, Dream.Character.Description
    has_one :character_before, Dream.Core.Character
    has_one :character_after, Dream.Core.Character
    
    timestamps()
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, [:secondary_id, :name, :display_name, :featured_image, :icon])
    |> validate_required([:secondary_id, :name, :display_name, :featured_image, :icon])
  end

  def new_changeset(character, attrs) do
    character
    |> cast(attrs, [:display_name])
    |> put_change(:name, Helper.display_name_convert(attrs["display_name"]))
    |> put_change(:secondary_id, Helper.generate_secondary_id())
    |> cast_assoc(:description)
    |> cast_assoc(:traits)
    |> cast_assoc(:narratives)
    |> cast_assoc(:journals)
    |> cast_assoc(:additional_descriptions)
    |> validate_required([:display_name, :name, :secondary_id, :description, :traits])
  end

  def update_changeset(character, attrs) do
    character
    |> cast(attrs, [:display_name])
    |> put_change(:name, Helper.display_name_convert(attrs["display_name"]))
    |> cast_assoc(:description)
    |> cast_assoc(:traits)
    |> cast_assoc(:narratives)    
    |> cast_assoc(:journals)
    |> cast_assoc(:additional_descriptions)
  end

end
