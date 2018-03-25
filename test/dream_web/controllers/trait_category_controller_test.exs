defmodule DreamWeb.TraitCategoryControllerTest do
  use DreamWeb.ConnCase

  alias Dream.Trait
  alias Dream.Trait.TraitCategory

  @create_attrs %{category: "some category", display_name: "some display_name", name: "some name"}
  @update_attrs %{category: "some updated category", display_name: "some updated display_name", name: "some updated name"}
  @invalid_attrs %{category: nil, display_name: nil, name: nil}

  def fixture(:trait_category) do
    {:ok, trait_category} = Trait.create_trait_category(@create_attrs)
    trait_category
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all trait_categories", %{conn: conn} do
      conn = get conn, trait_category_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create trait_category" do
    test "renders trait_category when data is valid", %{conn: conn} do
      conn = post conn, trait_category_path(conn, :create), trait_category: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, trait_category_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "category" => "some category",
        "display_name" => "some display_name",
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, trait_category_path(conn, :create), trait_category: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update trait_category" do
    setup [:create_trait_category]

    test "renders trait_category when data is valid", %{conn: conn, trait_category: %TraitCategory{id: id} = trait_category} do
      conn = put conn, trait_category_path(conn, :update, trait_category), trait_category: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, trait_category_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "category" => "some updated category",
        "display_name" => "some updated display_name",
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, trait_category: trait_category} do
      conn = put conn, trait_category_path(conn, :update, trait_category), trait_category: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete trait_category" do
    setup [:create_trait_category]

    test "deletes chosen trait_category", %{conn: conn, trait_category: trait_category} do
      conn = delete conn, trait_category_path(conn, :delete, trait_category)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, trait_category_path(conn, :show, trait_category)
      end
    end
  end

  defp create_trait_category(_) do
    trait_category = fixture(:trait_category)
    {:ok, trait_category: trait_category}
  end
end
