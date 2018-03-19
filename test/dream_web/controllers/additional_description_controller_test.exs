defmodule DreamWeb.AdditionalDescriptionControllerTest do
  use DreamWeb.ConnCase

  alias Dream.Character

  @create_attrs %{display_name: "some display_name", text: "some text"}
  @update_attrs %{display_name: "some updated display_name", text: "some updated text"}
  @invalid_attrs %{display_name: nil, text: nil}

  def fixture(:additional_description) do
    {:ok, additional_description} = Character.create_additional_description(@create_attrs)
    additional_description
  end

  describe "index" do
    test "lists all additional_descriptions", %{conn: conn} do
      conn = get conn, additional_description_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Additional descriptions"
    end
  end

  describe "new additional_description" do
    test "renders form", %{conn: conn} do
      conn = get conn, additional_description_path(conn, :new)
      assert html_response(conn, 200) =~ "New Additional description"
    end
  end

  describe "create additional_description" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, additional_description_path(conn, :create), additional_description: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == additional_description_path(conn, :show, id)

      conn = get conn, additional_description_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Additional description"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, additional_description_path(conn, :create), additional_description: @invalid_attrs
      assert html_response(conn, 200) =~ "New Additional description"
    end
  end

  describe "edit additional_description" do
    setup [:create_additional_description]

    test "renders form for editing chosen additional_description", %{conn: conn, additional_description: additional_description} do
      conn = get conn, additional_description_path(conn, :edit, additional_description)
      assert html_response(conn, 200) =~ "Edit Additional description"
    end
  end

  describe "update additional_description" do
    setup [:create_additional_description]

    test "redirects when data is valid", %{conn: conn, additional_description: additional_description} do
      conn = put conn, additional_description_path(conn, :update, additional_description), additional_description: @update_attrs
      assert redirected_to(conn) == additional_description_path(conn, :show, additional_description)

      conn = get conn, additional_description_path(conn, :show, additional_description)
      assert html_response(conn, 200) =~ "some updated display_name"
    end

    test "renders errors when data is invalid", %{conn: conn, additional_description: additional_description} do
      conn = put conn, additional_description_path(conn, :update, additional_description), additional_description: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Additional description"
    end
  end

  describe "delete additional_description" do
    setup [:create_additional_description]

    test "deletes chosen additional_description", %{conn: conn, additional_description: additional_description} do
      conn = delete conn, additional_description_path(conn, :delete, additional_description)
      assert redirected_to(conn) == additional_description_path(conn, :index)
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
