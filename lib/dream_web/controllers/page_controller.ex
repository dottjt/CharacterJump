defmodule DreamWeb.PageController do
  use DreamWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def test_app(conn, _params) do
    render conn, "test-app.html"
  end
end
