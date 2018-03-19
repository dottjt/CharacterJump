defmodule DreamWeb.TraitCategoryController do
  use DreamWeb, :controller

  alias Dream.Trait
  alias Dream.Trait.TraitCategory

  def index(conn, _params) do
    trait_categories = Trait.list_trait_categories()
    render(conn, "index.html", trait_categories: trait_categories)
  end

  def new(conn, _params) do
    changeset = Trait.change_trait_category(%TraitCategory{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"trait_category" => trait_category_params}) do
    case Trait.create_trait_category(trait_category_params) do
      {:ok, trait_category} ->
        conn
        |> put_flash(:info, "Trait category created successfully.")
        |> redirect(to: trait_category_path(conn, :show, trait_category))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    trait_category = Trait.get_trait_category!(id)
    render(conn, "show.html", trait_category: trait_category)
  end

  def edit(conn, %{"id" => id}) do
    trait_category = Trait.get_trait_category!(id)
    changeset = Trait.change_trait_category(trait_category)
    render(conn, "edit.html", trait_category: trait_category, changeset: changeset)
  end

  def update(conn, %{"id" => id, "trait_category" => trait_category_params}) do
    trait_category = Trait.get_trait_category!(id)

    case Trait.update_trait_category(trait_category, trait_category_params) do
      {:ok, trait_category} ->
        conn
        |> put_flash(:info, "Trait category updated successfully.")
        |> redirect(to: trait_category_path(conn, :show, trait_category))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", trait_category: trait_category, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    trait_category = Trait.get_trait_category!(id)
    {:ok, _trait_category} = Trait.delete_trait_category(trait_category)

    conn
    |> put_flash(:info, "Trait category deleted successfully.")
    |> redirect(to: trait_category_path(conn, :index))
  end
end
