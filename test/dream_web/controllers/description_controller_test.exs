defmodule DreamWeb.DescriptionControllerTest do
  use DreamWeb.ConnCase

  alias Dream.Character

  @create_attrs %{text: "some text"}
  @update_attrs %{text: "some updated text"}
  @invalid_attrs %{text: nil}

  def fixture(:description) do
    {:ok, description} = Character.create_description(@create_attrs)
    description
  end

  describe "index" do
    test "lists all descriptions", %{conn: conn} do
      conn = get conn, description_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Descriptions"
    end
  end

  describe "new description" do
    test "renders form", %{conn: conn} do
      conn = get conn, description_path(conn, :new)
      assert html_response(conn, 200) =~ "New Description"
    end
  end

  describe "create description" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, description_path(conn, :create), description: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == description_path(conn, :show, id)

      conn = get conn, description_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Description"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, description_path(conn, :create), description: @invalid_attrs
      assert html_response(conn, 200) =~ "New Description"
    end
  end

  describe "edit description" do
    setup [:create_description]

    test "renders form for editing chosen description", %{conn: conn, description: description} do
      conn = get conn, description_path(conn, :edit, description)
      assert html_response(conn, 200) =~ "Edit Description"
    end
  end

  describe "update description" do
    setup [:create_description]

    test "redirects when data is valid", %{conn: conn, description: description} do
      conn = put conn, description_path(conn, :update, description), description: @update_attrs
      assert redirected_to(conn) == description_path(conn, :show, description)

      conn = get conn, description_path(conn, :show, description)
      assert html_response(conn, 200) =~ "some updated text"
    end

    test "renders errors when data is invalid", %{conn: conn, description: description} do
      conn = put conn, description_path(conn, :update, description), description: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Description"
    end
  end

  describe "delete description" do
    setup [:create_description]

    test "deletes chosen description", %{conn: conn, description: description} do
      conn = delete conn, description_path(conn, :delete, description)
      assert redirected_to(conn) == description_path(conn, :index)
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
