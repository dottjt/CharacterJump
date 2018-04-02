defmodule Dream.Character.Journal do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "journals" do
    field :text, :string
    field :type, :string
    # field :character_id, :binary_id

    has_many :characters, Dream.Day.Character
    # belongs_to :character, Dream.Core.Character

    timestamps()
  end

  @doc false
  def changeset(journal, attrs) do
    journal
    |> cast(attrs, [:text, :type])
    |> validate_required([:text, :type])
  end

  def new_changeset(journal, attrs) do
    journal
    |> cast(attrs, [:text, :character_id])
    |> validate_required([:text, :character_id])
  end

end
