defmodule DreamWeb.TraitCategoryController do
  use DreamWeb, :controller

  alias Dream.Trait
  alias Dream.Trait.TraitCategory

  action_fallback DreamWeb.FallbackController

  def index(conn, _params) do
    trait_categories = Trait.list_trait_categories()
    render(conn, "index.json", trait_categories: trait_categories)
  end

  def create(conn, %{"trait_category" => trait_category_params}) do
    with {:ok, %TraitCategory{} = trait_category} <- Trait.create_trait_category(trait_category_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", trait_category_path(conn, :show, trait_category))
      |> render("show.json", trait_category: trait_category)
    end
  end

  def show(conn, %{"id" => id}) do
    trait_category = Trait.get_trait_category!(id)
    render(conn, "show.json", trait_category: trait_category)
  end

  def update(conn, %{"id" => id, "trait_category" => trait_category_params}) do
    trait_category = Trait.get_trait_category!(id)

    with {:ok, %TraitCategory{} = trait_category} <- Trait.update_trait_category(trait_category, trait_category_params) do
      render(conn, "show.json", trait_category: trait_category)
    end
  end

  def delete(conn, %{"id" => id}) do
    trait_category = Trait.get_trait_category!(id)
    with {:ok, %TraitCategory{}} <- Trait.delete_trait_category(trait_category) do
      send_resp(conn, :no_content, "")
    end
  end
end
