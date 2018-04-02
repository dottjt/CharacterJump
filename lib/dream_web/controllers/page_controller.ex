defmodule DreamWeb.PageController do
  use DreamWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def guides(conn, _params) do
    render conn, "guides.html"
  end

  def community(conn, _params) do
    render conn, "community.html"
  end

  def dashboard(conn, _params) do
    render conn, "dashboard.html", layout: {DreamWeb.LayoutView, "react.html"}
  end

end
