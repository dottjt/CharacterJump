defmodule Dream.Trait do
  @moduledoc """
  The Trait context.
  """

  import Ecto.Query, warn: false
  alias Dream.Repo

  alias Dream.Trait.TraitCategory

  @doc """
  Returns the list of trait_categories.

  ## Examples

      iex> list_trait_categories()
      [%TraitCategory{}, ...]

  """
  def list_trait_categories do
    Repo.all(TraitCategory)
  end

  @doc """
  Gets a single trait_category.

  Raises `Ecto.NoResultsError` if the Trait category does not exist.

  ## Examples

      iex> get_trait_category!(123)
      %TraitCategory{}

      iex> get_trait_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trait_category!(id), do: Repo.get!(TraitCategory, id)

  @doc """
  Creates a trait_category.

  ## Examples

      iex> create_trait_category(%{field: value})
      {:ok, %TraitCategory{}}

      iex> create_trait_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trait_category(attrs \\ %{}) do
    %TraitCategory{}
    |> TraitCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trait_category.

  ## Examples

      iex> update_trait_category(trait_category, %{field: new_value})
      {:ok, %TraitCategory{}}

      iex> update_trait_category(trait_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trait_category(%TraitCategory{} = trait_category, attrs) do
    trait_category
    |> TraitCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TraitCategory.

  ## Examples

      iex> delete_trait_category(trait_category)
      {:ok, %TraitCategory{}}

      iex> delete_trait_category(trait_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trait_category(%TraitCategory{} = trait_category) do
    Repo.delete(trait_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trait_category changes.

  ## Examples

      iex> change_trait_category(trait_category)
      %Ecto.Changeset{source: %TraitCategory{}}

  """
  def change_trait_category(%TraitCategory{} = trait_category) do
    TraitCategory.changeset(trait_category, %{})
  end
end
