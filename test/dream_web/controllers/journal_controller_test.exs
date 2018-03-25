defmodule DreamWeb.JournalControllerTest do
  use DreamWeb.ConnCase

  alias Dream.Character
  alias Dream.Character.Journal

  @create_attrs %{text: "some text"}
  @update_attrs %{text: "some updated text"}
  @invalid_attrs %{text: nil}

  def fixture(:journal) do
    {:ok, journal} = Character.create_journal(@create_attrs)
    journal
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all journals", %{conn: conn} do
      conn = get conn, journal_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create journal" do
    test "renders journal when data is valid", %{conn: conn} do
      conn = post conn, journal_path(conn, :create), journal: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, journal_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "text" => "some text"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, journal_path(conn, :create), journal: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update journal" do
    setup [:create_journal]

    test "renders journal when data is valid", %{conn: conn, journal: %Journal{id: id} = journal} do
      conn = put conn, journal_path(conn, :update, journal), journal: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, journal_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "text" => "some updated text"}
    end

    test "renders errors when data is invalid", %{conn: conn, journal: journal} do
      conn = put conn, journal_path(conn, :update, journal), journal: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete journal" do
    setup [:create_journal]

    test "deletes chosen journal", %{conn: conn, journal: journal} do
      conn = delete conn, journal_path(conn, :delete, journal)
      assert response(conn, 204)
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
