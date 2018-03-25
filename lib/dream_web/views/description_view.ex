defmodule DreamWeb.DescriptionView do
  use DreamWeb, :view
  alias DreamWeb.DescriptionView

  def render("index.json", %{descriptions: descriptions}) do
    %{data: render_many(descriptions, DescriptionView, "description.json")}
  end

  def render("show.json", %{description: description}) do
    %{data: render_one(description, DescriptionView, "description.json")}
  end

  def render("description.json", %{description: description}) do
    %{id: description.id,
      text: description.text}
  end
end
