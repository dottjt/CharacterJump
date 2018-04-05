defmodule DreamWeb.PageController do
  use DreamWeb, :controller
  
  def index(conn, _params) do
    render conn, "index.html", layout: {DreamWeb.LayoutView, "homepage.html"}
  end
  def guides(conn, _params) do
    render conn, "guides.html", layout: {DreamWeb.LayoutView, "guides_layout.html"}
  end
  def guides_introduction(conn, _params) do
    render conn, "guides_introduction.html", layout: {DreamWeb.LayoutView, "guides_layout.html"}
  end
  def guides_existing_approaches(conn, _params) do
    render conn, "guides_existing_approaches.html", layout: {DreamWeb.LayoutView, "guides_layout.html"}
  end
  def guides_our_approach(conn, _params) do
    render conn, "guides_our_approach.html", layout: {DreamWeb.LayoutView, "guides_layout.html"}
  end
  def guides_understanding_characters(conn, _params) do
    render conn, "guides_understanding_characters.html", layout: {DreamWeb.LayoutView, "guides_layout.html"}
  end
  def guides_identifying_characters(conn, _params) do
    render conn, "guides_identifying_characters.html", layout: {DreamWeb.LayoutView, "guides_layout.html"}
  end
  def guides_example_characters(conn, _params) do
    render conn, "guides_example_characters.html", layout: {DreamWeb.LayoutView, "guides_layout.html"}
  end
  def guides_external_resources(conn, _params) do
    render conn, "guides_external_resources.html", layout: {DreamWeb.LayoutView, "guides_layout.html"}
  end

  def community(conn, _params) do
    render conn, "community.html"
  end

  def dashboard(conn, _params) do
    render conn, "dashboard.html", layout: {DreamWeb.LayoutView, "react.html"}
  end

end
