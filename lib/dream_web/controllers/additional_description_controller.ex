defmodule DreamWeb.AdditionalDescriptionController do
  use DreamWeb, :controller

  alias Dream.Character
  alias Dream.Character.AdditionalDescription

  def index(conn, _params) do
    additional_descriptions = Character.list_additional_descriptions()
    render(conn, "index.html", additional_descriptions: additional_descriptions)
  end

  def new(conn, _params) do
    changeset = Character.change_additional_description(%AdditionalDescription{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"additional_description" => additional_description_params}) do
    case Character.create_additional_description(additional_description_params) do
      {:ok, additional_description} ->
        conn
        |> put_flash(:info, "Additional description created successfully.")
        |> redirect(to: additional_description_path(conn, :show, additional_description))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    additional_description = Character.get_additional_description!(id)
    render(conn, "show.html", additional_description: additional_description)
  end

  def edit(conn, %{"id" => id}) do
    additional_description = Character.get_additional_description!(id)
    changeset = Character.change_additional_description(additional_description)
    render(conn, "edit.html", additional_description: additional_description, changeset: changeset)
  end

  def update(conn, %{"id" => id, "additional_description" => additional_description_params}) do
    additional_description = Character.get_additional_description!(id)

    case Character.update_additional_description(additional_description, additional_description_params) do
      {:ok, additional_description} ->
        conn
        |> put_flash(:info, "Additional description updated successfully.")
        |> redirect(to: additional_description_path(conn, :show, additional_description))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", additional_description: additional_description, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    additional_description = Character.get_additional_description!(id)
    {:ok, _additional_description} = Character.delete_additional_description(additional_description)

    conn
    |> put_flash(:info, "Additional description deleted successfully.")
    |> redirect(to: additional_description_path(conn, :index))
  end
end
