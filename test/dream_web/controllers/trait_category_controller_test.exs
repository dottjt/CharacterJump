defmodule DreamWeb.TraitCategoryControllerTest do
  use DreamWeb.ConnCase

  alias Dream.Trait

  @create_attrs %{display_name: "some display_name", name: "some name"}
  @update_attrs %{display_name: "some updated display_name", name: "some updated name"}
  @invalid_attrs %{display_name: nil, name: nil}

  def fixture(:trait_category) do
    {:ok, trait_category} = Trait.create_trait_category(@create_attrs)
    trait_category
  end

  describe "index" do
    test "lists all trait_categories", %{conn: conn} do
      conn = get conn, trait_category_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Trait categories"
    end
  end

  describe "new trait_category" do
    test "renders form", %{conn: conn} do
      conn = get conn, trait_category_path(conn, :new)
      assert html_response(conn, 200) =~ "New Trait category"
    end
  end

  describe "create trait_category" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, trait_category_path(conn, :create), trait_category: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == trait_category_path(conn, :show, id)

      conn = get conn, trait_category_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Trait category"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, trait_category_path(conn, :create), trait_category: @invalid_attrs
      assert html_response(conn, 200) =~ "New Trait category"
    end
  end

  describe "edit trait_category" do
    setup [:create_trait_category]

    test "renders form for editing chosen trait_category", %{conn: conn, trait_category: trait_category} do
      conn = get conn, trait_category_path(conn, :edit, trait_category)
      assert html_response(conn, 200) =~ "Edit Trait category"
    end
  end

  describe "update trait_category" do
    setup [:create_trait_category]

    test "redirects when data is valid", %{conn: conn, trait_category: trait_category} do
      conn = put conn, trait_category_path(conn, :update, trait_category), trait_category: @update_attrs
      assert redirected_to(conn) == trait_category_path(conn, :show, trait_category)

      conn = get conn, trait_category_path(conn, :show, trait_category)
      assert html_response(conn, 200) =~ "some updated display_name"
    end

    test "renders errors when data is invalid", %{conn: conn, trait_category: trait_category} do
      conn = put conn, trait_category_path(conn, :update, trait_category), trait_category: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Trait category"
    end
  end

  describe "delete trait_category" do
    setup [:create_trait_category]

    test "deletes chosen trait_category", %{conn: conn, trait_category: trait_category} do
      conn = delete conn, trait_category_path(conn, :delete, trait_category)
      assert redirected_to(conn) == trait_category_path(conn, :index)
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
