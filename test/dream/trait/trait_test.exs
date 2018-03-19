defmodule Dream.TraitTest do
  use Dream.DataCase

  alias Dream.Trait

  describe "trait_categories" do
    alias Dream.Trait.TraitCategory

    @valid_attrs %{display_name: "some display_name", name: "some name"}
    @update_attrs %{display_name: "some updated display_name", name: "some updated name"}
    @invalid_attrs %{display_name: nil, name: nil}

    def trait_category_fixture(attrs \\ %{}) do
      {:ok, trait_category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trait.create_trait_category()

      trait_category
    end

    test "list_trait_categories/0 returns all trait_categories" do
      trait_category = trait_category_fixture()
      assert Trait.list_trait_categories() == [trait_category]
    end

    test "get_trait_category!/1 returns the trait_category with given id" do
      trait_category = trait_category_fixture()
      assert Trait.get_trait_category!(trait_category.id) == trait_category
    end

    test "create_trait_category/1 with valid data creates a trait_category" do
      assert {:ok, %TraitCategory{} = trait_category} = Trait.create_trait_category(@valid_attrs)
      assert trait_category.display_name == "some display_name"
      assert trait_category.name == "some name"
    end

    test "create_trait_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trait.create_trait_category(@invalid_attrs)
    end

    test "update_trait_category/2 with valid data updates the trait_category" do
      trait_category = trait_category_fixture()
      assert {:ok, trait_category} = Trait.update_trait_category(trait_category, @update_attrs)
      assert %TraitCategory{} = trait_category
      assert trait_category.display_name == "some updated display_name"
      assert trait_category.name == "some updated name"
    end

    test "update_trait_category/2 with invalid data returns error changeset" do
      trait_category = trait_category_fixture()
      assert {:error, %Ecto.Changeset{}} = Trait.update_trait_category(trait_category, @invalid_attrs)
      assert trait_category == Trait.get_trait_category!(trait_category.id)
    end

    test "delete_trait_category/1 deletes the trait_category" do
      trait_category = trait_category_fixture()
      assert {:ok, %TraitCategory{}} = Trait.delete_trait_category(trait_category)
      assert_raise Ecto.NoResultsError, fn -> Trait.get_trait_category!(trait_category.id) end
    end

    test "change_trait_category/1 returns a trait_category changeset" do
      trait_category = trait_category_fixture()
      assert %Ecto.Changeset{} = Trait.change_trait_category(trait_category)
    end
  end
end
