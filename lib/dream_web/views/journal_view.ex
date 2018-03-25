defmodule DreamWeb.JournalView do
  use DreamWeb, :view
  alias DreamWeb.JournalView

  def render("index.json", %{journals: journals}) do
    %{data: render_many(journals, JournalView, "journal.json")}
  end

  def render("show.json", %{journal: journal}) do
    %{data: render_one(journal, JournalView, "journal.json")}
  end

  def render("journal.json", %{journal: journal}) do
    %{id: journal.id,
      text: journal.text}
  end
end
