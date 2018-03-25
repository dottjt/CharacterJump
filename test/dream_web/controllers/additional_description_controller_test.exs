defmodule DreamWeb.AdditionalDescriptionControllerTest do
  use DreamWeb.ConnCase

  alias Dream.Character
  alias Dream.Character.AdditionalDescription

  @create_attrs %{display_name: "some display_name", text: "some text"}
  @update_attrs %{display_name: "some updated display_name", text: "some updated text"}
  @invalid_attrs %{display_name: nil, text: nil}

  def fixture(:additional_description) do
    {:ok, additional_description} = Character.create_additional_description(@create_attrs)
    additional_description
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all additional_descriptions", %{conn: conn} do
      conn = get conn, additional_description_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create additional_description" do
    test "renders additional_description when data is valid", %{conn: conn} do
      conn = post conn, additional_description_path(conn, :create), additional_description: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, additional_description_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "display_name" => "some display_name",
        "text" => "some text"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, additional_description_path(conn, :create), additional_description: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update additional_description" do
    setup [:create_additional_description]

    test "renders additional_description when data is valid", %{conn: conn, additional_description: %AdditionalDescription{id: id} = additional_description} do
      conn = put conn, additional_description_path(conn, :update, additional_description), additional_description: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, additional_description_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "display_name" => "some updated display_name",
        "text" => "some updated text"}
    end

    test "renders errors when data is invalid", %{conn: conn, additional_description: additional_description} do
      conn = put conn, additional_description_path(conn, :update, additional_description), additional_description: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete additional_description" do
    setup [:create_additional_description]

    test "deletes chosen additional_description", %{conn: conn, additional_description: additional_description} do
      conn = delete conn, additional_description_path(conn, :delete, additional_description)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, additional_description_path(conn, :show, additional_description)
      end
    end
  end

  defp create_additional_description(_) do
    additional_description = fixture(:additional_description)
    {:ok, additional_description: additional_description}
  end
end
