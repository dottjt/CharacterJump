defmodule DreamWeb.AdditionalDescriptionView do
  use DreamWeb, :view
  alias DreamWeb.AdditionalDescriptionView

  def render("index.json", %{additional_descriptions: additional_descriptions}) do
    %{data: render_many(additional_descriptions, AdditionalDescriptionView, "additional_description.json")}
  end

  def render("show.json", %{additional_description: additional_description}) do
    %{data: render_one(additional_description, AdditionalDescriptionView, "additional_description.json")}
  end

  def render("additional_description.json", %{additional_description: additional_description}) do
    %{id: additional_description.id,
      display_name: additional_description.display_name,
      text: additional_description.text}
  end
end
