defmodule Dream.Character.AdditionalDescription do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "additional_descriptions" do
    field :display_name, :string
    field :text, :string
    # field :character_id, :binary_id

    belongs_to :character, Dream.Core.Character

    timestamps()
  end

  @doc false
  def changeset(additional_description, attrs) do
    additional_description
    |> cast(attrs, [:display_name, :text])
    |> validate_required([:display_name, :text])
  end

  def new_changeset(additional_description, attrs) do
    additional_description
    |> cast(attrs, [:display_name, :text, :character_id])
    |> validate_required([:display_name, :text, :character_id])
  end

end
