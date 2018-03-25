defmodule DreamWeb.NarrativeView do
  use DreamWeb, :view
  alias DreamWeb.NarrativeView

  def render("index.json", %{narratives: narratives}) do
    %{data: render_many(narratives, NarrativeView, "narrative.json")}
  end

  def render("show.json", %{narrative: narrative}) do
    %{data: render_one(narrative, NarrativeView, "narrative.json")}
  end

  def render("narrative.json", %{narrative: narrative}) do
    %{id: narrative.id,
      text: narrative.text}
  end
end
