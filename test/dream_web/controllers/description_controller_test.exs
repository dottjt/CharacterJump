defmodule DreamWeb.DescriptionControllerTest do
  use DreamWeb.ConnCase

  alias Dream.Character
  alias Dream.Character.Description

  @create_attrs %{text: "some text"}
  @update_attrs %{text: "some updated text"}
  @invalid_attrs %{text: nil}

  def fixture(:description) do
    {:ok, description} = Character.create_description(@create_attrs)
    description
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all descriptions", %{conn: conn} do
      conn = get conn, description_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create description" do
    test "renders description when data is valid", %{conn: conn} do
      conn = post conn, description_path(conn, :create), description: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, description_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "text" => "some text"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, description_path(conn, :create), description: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update description" do
    setup [:create_description]

    test "renders description when data is valid", %{conn: conn, description: %Description{id: id} = description} do
      conn = put conn, description_path(conn, :update, description), description: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, description_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "text" => "some updated text"}
    end

    test "renders errors when data is invalid", %{conn: conn, description: description} do
      conn = put conn, description_path(conn, :update, description), description: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete description" do
    setup [:create_description]

    test "deletes chosen description", %{conn: conn, description: description} do
      conn = delete conn, description_path(conn, :delete, description)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, description_path(conn, :show, description)
      end
    end
  end

  defp create_description(_) do
    description = fixture(:description)
    {:ok, description: description}
  end
end
