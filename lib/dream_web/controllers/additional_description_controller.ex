defmodule DreamWeb.AdditionalDescriptionController do
  use DreamWeb, :controller

  alias Dream.Character
  alias Dream.Character.AdditionalDescription

  action_fallback DreamWeb.FallbackController

  def index(conn, _params) do
    additional_descriptions = Character.list_additional_descriptions()
    render(conn, "index.json", additional_descriptions: additional_descriptions)
  end

  def create(conn, %{"additional_description" => additional_description_params}) do
    with {:ok, %AdditionalDescription{} = additional_description} <- Character.create_additional_description(additional_description_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", additional_description_path(conn, :show, additional_description))
      |> render(DreamWeb.AppView, "additional_description.json", additional_description: additional_description)
    end
  end

  def show(conn, %{"id" => id}) do
    additional_description = Character.get_additional_description!(id)
    render(conn, DreamWeb.AppView, "additional_description.json", additional_description: additional_description)
  end

  def update(conn, %{"id" => id, "additional_description" => additional_description_params}) do
    additional_description = Character.get_additional_description!(id)

    with {:ok, %AdditionalDescription{} = additional_description} <- Character.update_additional_description(additional_description, additional_description_params) do
      render(conn, DreamWeb.AppView, "additional_description.json", additional_description: additional_description)
    end
  end

  def delete(conn, %{"id" => id}) do
    additional_description = Character.get_additional_description!(id)
    with {:ok, %AdditionalDescription{}} <- Character.delete_additional_description(additional_description) do
      send_resp(conn, :no_content, "")
    end
  end
end
