defmodule DreamWeb.AppView do
  use DreamWeb, :view

  def render("initial_state.json", %{timeline: timeline, characters: characters}) do
    %{timeline: render_many(timeline, DreamWeb.AppView, "timeline.json", as: :timeline),
      characters: render_many(characters, DreamWeb.AppView, "character_assoc.json", as: :character_assoc)}
  end

  def render("timeline.json", %{timeline: timeline}) do
    %{id: timeline.id,
      inserted_at: timeline.inserted_at,
      characters: render_many(timeline.characters, DreamWeb.AppView, "character.json", as: :character)}
  end

  def render("character.json", %{character: character}) do
    %{id: character.id,
      secondary_id: character.secondary_id,
      name: character.name,
      display_name: character.display_name}
  end

  def render("character_assoc.json", %{character_assoc: character_assoc}) do
    %{id: character_assoc.id,
      secondary_id: character_assoc.secondary_id,
      name: character_assoc.name,
      display_name: character_assoc.display_name,
      traits: render_many(character_assoc.traits, DreamWeb.AppView, "trait.json", as: :trait),
      journals: render_many(character_assoc.journals, DreamWeb.AppView, "journal.json", as: :journal),
      additional_descriptions: render_many(character_assoc.additional_descriptions, DreamWeb.AppView, "additiona_description.json", as: :additiona_description),

      description: render_one(character_assoc.description, DreamWeb.AppView, "description.json", as: :description)}
      # character_before: render_one(character_assoc.character_before, DreamWeb.AppView, "character.json", as: :character),
      # character_after: render_one(character_assoc.character_after, DreamWeb.AppView, "character.json", as: :character)}
  end

  def render("trait.json", %{trait: trait}) do
    %{id: trait.id,
      name: trait.name,
      display_name: trait.display_name,
      category: trait.category}
  end

  def render("description.json", %{description: description}) do
    %{id: description.id,
      text: description.text}
  end

  def render("additional_description.json", %{additional_description: additional_description}) do
    %{id: additional_description.id,
      text: additional_description.text}
  end

  def render("journal.json", %{journal: journal}) do
    %{id: journal.id,
      text: journal.text,
      inserted_at: journal.inserted_at}
  end
end
