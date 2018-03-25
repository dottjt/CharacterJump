defmodule DreamWeb.CharacterControllerTest do
  use DreamWeb.ConnCase

  alias Dream.Core
  alias Dream.Core.Character

  @create_attrs %{display_name: "some display_name", featured_image: "some featured_image", icon: "some icon", name: "some name", secondary_id: "some secondary_id"}
  @update_attrs %{display_name: "some updated display_name", featured_image: "some updated featured_image", icon: "some updated icon", name: "some updated name", secondary_id: "some updated secondary_id"}
  @invalid_attrs %{display_name: nil, featured_image: nil, icon: nil, name: nil, secondary_id: nil}

  def fixture(:character) do
    {:ok, character} = Core.create_character(@create_attrs)
    character
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all characters", %{conn: conn} do
      conn = get conn, character_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create character" do
    test "renders character when data is valid", %{conn: conn} do
      conn = post conn, character_path(conn, :create), character: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, character_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "display_name" => "some display_name",
        "featured_image" => "some featured_image",
        "icon" => "some icon",
        "name" => "some name",
        "secondary_id" => "some secondary_id"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, character_path(conn, :create), character: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update character" do
    setup [:create_character]

    test "renders character when data is valid", %{conn: conn, character: %Character{id: id} = character} do
      conn = put conn, character_path(conn, :update, character), character: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, character_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "display_name" => "some updated display_name",
        "featured_image" => "some updated featured_image",
        "icon" => "some updated icon",
        "name" => "some updated name",
        "secondary_id" => "some updated secondary_id"}
    end

    test "renders errors when data is invalid", %{conn: conn, character: character} do
      conn = put conn, character_path(conn, :update, character), character: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete character" do
    setup [:create_character]

    test "deletes chosen character", %{conn: conn, character: character} do
      conn = delete conn, character_path(conn, :delete, character)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, character_path(conn, :show, character)
      end
    end
  end

  defp create_character(_) do
    character = fixture(:character)
    {:ok, character: character}
  end
end
