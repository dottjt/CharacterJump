defmodule Dream.CharacterTest do
  use Dream.DataCase

  alias Dream.Character

  describe "descriptions" do
    alias Dream.Character.Description

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def description_fixture(attrs \\ %{}) do
      {:ok, description} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Character.create_description()

      description
    end

    test "list_descriptions/0 returns all descriptions" do
      description = description_fixture()
      assert Character.list_descriptions() == [description]
    end

    test "get_description!/1 returns the description with given id" do
      description = description_fixture()
      assert Character.get_description!(description.id) == description
    end

    test "create_description/1 with valid data creates a description" do
      assert {:ok, %Description{} = description} = Character.create_description(@valid_attrs)
      assert description.text == "some text"
    end

    test "create_description/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Character.create_description(@invalid_attrs)
    end

    test "update_description/2 with valid data updates the description" do
      description = description_fixture()
      assert {:ok, description} = Character.update_description(description, @update_attrs)
      assert %Description{} = description
      assert description.text == "some updated text"
    end

    test "update_description/2 with invalid data returns error changeset" do
      description = description_fixture()
      assert {:error, %Ecto.Changeset{}} = Character.update_description(description, @invalid_attrs)
      assert description == Character.get_description!(description.id)
    end

    test "delete_description/1 deletes the description" do
      description = description_fixture()
      assert {:ok, %Description{}} = Character.delete_description(description)
      assert_raise Ecto.NoResultsError, fn -> Character.get_description!(description.id) end
    end

    test "change_description/1 returns a description changeset" do
      description = description_fixture()
      assert %Ecto.Changeset{} = Character.change_description(description)
    end
  end

  describe "journals" do
    alias Dream.Character.Journal

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def journal_fixture(attrs \\ %{}) do
      {:ok, journal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Character.create_journal()

      journal
    end

    test "list_journals/0 returns all journals" do
      journal = journal_fixture()
      assert Character.list_journals() == [journal]
    end

    test "get_journal!/1 returns the journal with given id" do
      journal = journal_fixture()
      assert Character.get_journal!(journal.id) == journal
    end

    test "create_journal/1 with valid data creates a journal" do
      assert {:ok, %Journal{} = journal} = Character.create_journal(@valid_attrs)
      assert journal.text == "some text"
    end

    test "create_journal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Character.create_journal(@invalid_attrs)
    end

    test "update_journal/2 with valid data updates the journal" do
      journal = journal_fixture()
      assert {:ok, journal} = Character.update_journal(journal, @update_attrs)
      assert %Journal{} = journal
      assert journal.text == "some updated text"
    end

    test "update_journal/2 with invalid data returns error changeset" do
      journal = journal_fixture()
      assert {:error, %Ecto.Changeset{}} = Character.update_journal(journal, @invalid_attrs)
      assert journal == Character.get_journal!(journal.id)
    end

    test "delete_journal/1 deletes the journal" do
      journal = journal_fixture()
      assert {:ok, %Journal{}} = Character.delete_journal(journal)
      assert_raise Ecto.NoResultsError, fn -> Character.get_journal!(journal.id) end
    end

    test "change_journal/1 returns a journal changeset" do
      journal = journal_fixture()
      assert %Ecto.Changeset{} = Character.change_journal(journal)
    end
  end

  describe "additional_descriptions" do
    alias Dream.Character.AdditionalDescription

    @valid_attrs %{display_name: "some display_name", text: "some text"}
    @update_attrs %{display_name: "some updated display_name", text: "some updated text"}
    @invalid_attrs %{display_name: nil, text: nil}

    def additional_description_fixture(attrs \\ %{}) do
      {:ok, additional_description} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Character.create_additional_description()

      additional_description
    end

    test "list_additional_descriptions/0 returns all additional_descriptions" do
      additional_description = additional_description_fixture()
      assert Character.list_additional_descriptions() == [additional_description]
    end

    test "get_additional_description!/1 returns the additional_description with given id" do
      additional_description = additional_description_fixture()
      assert Character.get_additional_description!(additional_description.id) == additional_description
    end

    test "create_additional_description/1 with valid data creates a additional_description" do
      assert {:ok, %AdditionalDescription{} = additional_description} = Character.create_additional_description(@valid_attrs)
      assert additional_description.display_name == "some display_name"
      assert additional_description.text == "some text"
    end

    test "create_additional_description/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Character.create_additional_description(@invalid_attrs)
    end

    test "update_additional_description/2 with valid data updates the additional_description" do
      additional_description = additional_description_fixture()
      assert {:ok, additional_description} = Character.update_additional_description(additional_description, @update_attrs)
      assert %AdditionalDescription{} = additional_description
      assert additional_description.display_name == "some updated display_name"
      assert additional_description.text == "some updated text"
    end

    test "update_additional_description/2 with invalid data returns error changeset" do
      additional_description = additional_description_fixture()
      assert {:error, %Ecto.Changeset{}} = Character.update_additional_description(additional_description, @invalid_attrs)
      assert additional_description == Character.get_additional_description!(additional_description.id)
    end

    test "delete_additional_description/1 deletes the additional_description" do
      additional_description = additional_description_fixture()
      assert {:ok, %AdditionalDescription{}} = Character.delete_additional_description(additional_description)
      assert_raise Ecto.NoResultsError, fn -> Character.get_additional_description!(additional_description.id) end
    end

    test "change_additional_description/1 returns a additional_description changeset" do
      additional_description = additional_description_fixture()
      assert %Ecto.Changeset{} = Character.change_additional_description(additional_description)
    end
  end

  describe "traits" do
    alias Dream.Character.Trait

    @valid_attrs %{display_name: "some display_name", excerpt: "some excerpt", featured_image: "some featured_image", name: "some name"}
    @update_attrs %{display_name: "some updated display_name", excerpt: "some updated excerpt", featured_image: "some updated featured_image", name: "some updated name"}
    @invalid_attrs %{display_name: nil, excerpt: nil, featured_image: nil, name: nil}

    def trait_fixture(attrs \\ %{}) do
      {:ok, trait} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Character.create_trait()

      trait
    end

    test "list_traits/0 returns all traits" do
      trait = trait_fixture()
      assert Character.list_traits() == [trait]
    end

    test "get_trait!/1 returns the trait with given id" do
      trait = trait_fixture()
      assert Character.get_trait!(trait.id) == trait
    end

    test "create_trait/1 with valid data creates a trait" do
      assert {:ok, %Trait{} = trait} = Character.create_trait(@valid_attrs)
      assert trait.display_name == "some display_name"
      assert trait.excerpt == "some excerpt"
      assert trait.featured_image == "some featured_image"
      assert trait.name == "some name"
    end

    test "create_trait/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Character.create_trait(@invalid_attrs)
    end

    test "update_trait/2 with valid data updates the trait" do
      trait = trait_fixture()
      assert {:ok, trait} = Character.update_trait(trait, @update_attrs)
      assert %Trait{} = trait
      assert trait.display_name == "some updated display_name"
      assert trait.excerpt == "some updated excerpt"
      assert trait.featured_image == "some updated featured_image"
      assert trait.name == "some updated name"
    end

    test "update_trait/2 with invalid data returns error changeset" do
      trait = trait_fixture()
      assert {:error, %Ecto.Changeset{}} = Character.update_trait(trait, @invalid_attrs)
      assert trait == Character.get_trait!(trait.id)
    end

    test "delete_trait/1 deletes the trait" do
      trait = trait_fixture()
      assert {:ok, %Trait{}} = Character.delete_trait(trait)
      assert_raise Ecto.NoResultsError, fn -> Character.get_trait!(trait.id) end
    end

    test "change_trait/1 returns a trait changeset" do
      trait = trait_fixture()
      assert %Ecto.Changeset{} = Character.change_trait(trait)
    end
  end
end
