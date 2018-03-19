defmodule DreamWeb.JournalControllerTest do
  use DreamWeb.ConnCase

  alias Dream.Character

  @create_attrs %{text: "some text"}
  @update_attrs %{text: "some updated text"}
  @invalid_attrs %{text: nil}

  def fixture(:journal) do
    {:ok, journal} = Character.create_journal(@create_attrs)
    journal
  end

  describe "index" do
    test "lists all journals", %{conn: conn} do
      conn = get conn, journal_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Journals"
    end
  end

  describe "new journal" do
    test "renders form", %{conn: conn} do
      conn = get conn, journal_path(conn, :new)
      assert html_response(conn, 200) =~ "New Journal"
    end
  end

  describe "create journal" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, journal_path(conn, :create), journal: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == journal_path(conn, :show, id)

      conn = get conn, journal_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Journal"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, journal_path(conn, :create), journal: @invalid_attrs
      assert html_response(conn, 200) =~ "New Journal"
    end
  end

  describe "edit journal" do
    setup [:create_journal]

    test "renders form for editing chosen journal", %{conn: conn, journal: journal} do
      conn = get conn, journal_path(conn, :edit, journal)
      assert html_response(conn, 200) =~ "Edit Journal"
    end
  end

  describe "update journal" do
    setup [:create_journal]

    test "redirects when data is valid", %{conn: conn, journal: journal} do
      conn = put conn, journal_path(conn, :update, journal), journal: @update_attrs
      assert redirected_to(conn) == journal_path(conn, :show, journal)

      conn = get conn, journal_path(conn, :show, journal)
      assert html_response(conn, 200) =~ "some updated text"
    end

    test "renders errors when data is invalid", %{conn: conn, journal: journal} do
      conn = put conn, journal_path(conn, :update, journal), journal: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Journal"
    end
  end

  describe "delete journal" do
    setup [:create_journal]

    test "deletes chosen journal", %{conn: conn, journal: journal} do
      conn = delete conn, journal_path(conn, :delete, journal)
      assert redirected_to(conn) == journal_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, journal_path(conn, :show, journal)
      end
    end
  end

  defp create_journal(_) do
    journal = fixture(:journal)
    {:ok, journal: journal}
  end
end
