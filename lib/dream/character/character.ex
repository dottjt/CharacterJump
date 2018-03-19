defmodule Dream.Character do
  @moduledoc """
  The Character context.
  """

  import Ecto.Query, warn: false
  alias Dream.Repo

  alias Dream.Character.Description

  @doc """
  Returns the list of descriptions.

  ## Examples

      iex> list_descriptions()
      [%Description{}, ...]

  """
  def list_descriptions do
    Repo.all(Description)
  end

  @doc """
  Gets a single description.

  Raises `Ecto.NoResultsError` if the Description does not exist.

  ## Examples

      iex> get_description!(123)
      %Description{}

      iex> get_description!(456)
      ** (Ecto.NoResultsError)

  """
  def get_description!(id), do: Repo.get!(Description, id)

  @doc """
  Creates a description.

  ## Examples

      iex> create_description(%{field: value})
      {:ok, %Description{}}

      iex> create_description(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_description(attrs \\ %{}) do
    %Description{}
    |> Description.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a description.

  ## Examples

      iex> update_description(description, %{field: new_value})
      {:ok, %Description{}}

      iex> update_description(description, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_description(%Description{} = description, attrs) do
    description
    |> Description.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Description.

  ## Examples

      iex> delete_description(description)
      {:ok, %Description{}}

      iex> delete_description(description)
      {:error, %Ecto.Changeset{}}

  """
  def delete_description(%Description{} = description) do
    Repo.delete(description)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking description changes.

  ## Examples

      iex> change_description(description)
      %Ecto.Changeset{source: %Description{}}

  """
  def change_description(%Description{} = description) do
    Description.changeset(description, %{})
  end

  alias Dream.Character.Journal

  @doc """
  Returns the list of journals.

  ## Examples

      iex> list_journals()
      [%Journal{}, ...]

  """
  def list_journals do
    Repo.all(Journal)
  end

  @doc """
  Gets a single journal.

  Raises `Ecto.NoResultsError` if the Journal does not exist.

  ## Examples

      iex> get_journal!(123)
      %Journal{}

      iex> get_journal!(456)
      ** (Ecto.NoResultsError)

  """
  def get_journal!(id), do: Repo.get!(Journal, id)

  @doc """
  Creates a journal.

  ## Examples

      iex> create_journal(%{field: value})
      {:ok, %Journal{}}

      iex> create_journal(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_journal(attrs \\ %{}) do
    %Journal{}
    |> Journal.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a journal.

  ## Examples

      iex> update_journal(journal, %{field: new_value})
      {:ok, %Journal{}}

      iex> update_journal(journal, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_journal(%Journal{} = journal, attrs) do
    journal
    |> Journal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Journal.

  ## Examples

      iex> delete_journal(journal)
      {:ok, %Journal{}}

      iex> delete_journal(journal)
      {:error, %Ecto.Changeset{}}

  """
  def delete_journal(%Journal{} = journal) do
    Repo.delete(journal)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking journal changes.

  ## Examples

      iex> change_journal(journal)
      %Ecto.Changeset{source: %Journal{}}

  """
  def change_journal(%Journal{} = journal) do
    Journal.changeset(journal, %{})
  end

  alias Dream.Character.AdditionalDescription

  @doc """
  Returns the list of additional_descriptions.

  ## Examples

      iex> list_additional_descriptions()
      [%AdditionalDescription{}, ...]

  """
  def list_additional_descriptions do
    Repo.all(AdditionalDescription)
  end

  @doc """
  Gets a single additional_description.

  Raises `Ecto.NoResultsError` if the Additional description does not exist.

  ## Examples

      iex> get_additional_description!(123)
      %AdditionalDescription{}

      iex> get_additional_description!(456)
      ** (Ecto.NoResultsError)

  """
  def get_additional_description!(id), do: Repo.get!(AdditionalDescription, id)

  @doc """
  Creates a additional_description.

  ## Examples

      iex> create_additional_description(%{field: value})
      {:ok, %AdditionalDescription{}}

      iex> create_additional_description(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_additional_description(attrs \\ %{}) do
    %AdditionalDescription{}
    |> AdditionalDescription.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a additional_description.

  ## Examples

      iex> update_additional_description(additional_description, %{field: new_value})
      {:ok, %AdditionalDescription{}}

      iex> update_additional_description(additional_description, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_additional_description(%AdditionalDescription{} = additional_description, attrs) do
    additional_description
    |> AdditionalDescription.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AdditionalDescription.

  ## Examples

      iex> delete_additional_description(additional_description)
      {:ok, %AdditionalDescription{}}

      iex> delete_additional_description(additional_description)
      {:error, %Ecto.Changeset{}}

  """
  def delete_additional_description(%AdditionalDescription{} = additional_description) do
    Repo.delete(additional_description)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking additional_description changes.

  ## Examples

      iex> change_additional_description(additional_description)
      %Ecto.Changeset{source: %AdditionalDescription{}}

  """
  def change_additional_description(%AdditionalDescription{} = additional_description) do
    AdditionalDescription.changeset(additional_description, %{})
  end

  alias Dream.Character.Trait

  @doc """
  Returns the list of traits.

  ## Examples

      iex> list_traits()
      [%Trait{}, ...]

  """
  def list_traits do
    Repo.all(Trait)
  end

  @doc """
  Gets a single trait.

  Raises `Ecto.NoResultsError` if the Trait does not exist.

  ## Examples

      iex> get_trait!(123)
      %Trait{}

      iex> get_trait!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trait!(id), do: Repo.get!(Trait, id)

  @doc """
  Creates a trait.

  ## Examples

      iex> create_trait(%{field: value})
      {:ok, %Trait{}}

      iex> create_trait(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trait(attrs \\ %{}) do
    %Trait{}
    |> Trait.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trait.

  ## Examples

      iex> update_trait(trait, %{field: new_value})
      {:ok, %Trait{}}

      iex> update_trait(trait, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trait(%Trait{} = trait, attrs) do
    trait
    |> Trait.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Trait.

  ## Examples

      iex> delete_trait(trait)
      {:ok, %Trait{}}

      iex> delete_trait(trait)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trait(%Trait{} = trait) do
    Repo.delete(trait)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trait changes.

  ## Examples

      iex> change_trait(trait)
      %Ecto.Changeset{source: %Trait{}}

  """
  def change_trait(%Trait{} = trait) do
    Trait.changeset(trait, %{})
  end
end
