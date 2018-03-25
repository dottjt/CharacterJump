defmodule DreamWeb.DescriptionController do
  use DreamWeb, :controller

  alias Dream.Character
  alias Dream.Character.Description

  action_fallback DreamWeb.FallbackController

  def index(conn, _params) do
    descriptions = Character.list_descriptions()
    render(conn, "index.json", descriptions: descriptions)
  end

  def create(conn, %{"description" => description_params}) do
    with {:ok, %Description{} = description} <- Character.create_description(description_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", description_path(conn, :show, description))
      |> render(DreamWeb.AppView, "description.json", description: description)
    end
  end

  def show(conn, %{"id" => id}) do
    description = Character.get_description!(id)
    render(conn, DreamWeb.AppView, "description.json", description: description)
  end

  def update(conn, %{"id" => id, "description" => description_params}) do
    description = Character.get_description!(id)

    with {:ok, %Description{} = description} <- Character.update_description(description, description_params) do
      render(conn, DreamWeb.AppView, "description.json", description: description)
    end
  end

  def delete(conn, %{"id" => id}) do
    description = Character.get_description!(id)
    with {:ok, %Description{}} <- Character.delete_description(description) do
      send_resp(conn, :no_content, "")
    end
  end
end
