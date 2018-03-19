defmodule Dream.CoreTest do
  use Dream.DataCase

  alias Dream.Core

  describe "days" do
    alias Dream.Core.Day

    @valid_attrs %{display_name: "some display_name", name: "some name"}
    @update_attrs %{display_name: "some updated display_name", name: "some updated name"}
    @invalid_attrs %{display_name: nil, name: nil}

    def day_fixture(attrs \\ %{}) do
      {:ok, day} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_day()

      day
    end

    test "list_days/0 returns all days" do
      day = day_fixture()
      assert Core.list_days() == [day]
    end

    test "get_day!/1 returns the day with given id" do
      day = day_fixture()
      assert Core.get_day!(day.id) == day
    end

    test "create_day/1 with valid data creates a day" do
      assert {:ok, %Day{} = day} = Core.create_day(@valid_attrs)
      assert day.display_name == "some display_name"
      assert day.name == "some name"
    end

    test "create_day/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_day(@invalid_attrs)
    end

    test "update_day/2 with valid data updates the day" do
      day = day_fixture()
      assert {:ok, day} = Core.update_day(day, @update_attrs)
      assert %Day{} = day
      assert day.display_name == "some updated display_name"
      assert day.name == "some updated name"
    end

    test "update_day/2 with invalid data returns error changeset" do
      day = day_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_day(day, @invalid_attrs)
      assert day == Core.get_day!(day.id)
    end

    test "delete_day/1 deletes the day" do
      day = day_fixture()
      assert {:ok, %Day{}} = Core.delete_day(day)
      assert_raise Ecto.NoResultsError, fn -> Core.get_day!(day.id) end
    end

    test "change_day/1 returns a day changeset" do
      day = day_fixture()
      assert %Ecto.Changeset{} = Core.change_day(day)
    end
  end

  describe "characters" do
    alias Dream.Core.Character

    @valid_attrs %{display_name: "some display_name", featured_image: "some featured_image", icon: "some icon", name: "some name", secondary_id: "some secondary_id"}
    @update_attrs %{display_name: "some updated display_name", featured_image: "some updated featured_image", icon: "some updated icon", name: "some updated name", secondary_id: "some updated secondary_id"}
    @invalid_attrs %{display_name: nil, featured_image: nil, icon: nil, name: nil, secondary_id: nil}

    def character_fixture(attrs \\ %{}) do
      {:ok, character} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_character()

      character
    end

    test "list_characters/0 returns all characters" do
      character = character_fixture()
      assert Core.list_characters() == [character]
    end

    test "get_character!/1 returns the character with given id" do
      character = character_fixture()
      assert Core.get_character!(character.id) == character
    end

    test "create_character/1 with valid data creates a character" do
      assert {:ok, %Character{} = character} = Core.create_character(@valid_attrs)
      assert character.display_name == "some display_name"
      assert character.featured_image == "some featured_image"
      assert character.icon == "some icon"
      assert character.name == "some name"
      assert character.secondary_id == "some secondary_id"
    end

    test "create_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_character(@invalid_attrs)
    end

    test "update_character/2 with valid data updates the character" do
      character = character_fixture()
      assert {:ok, character} = Core.update_character(character, @update_attrs)
      assert %Character{} = character
      assert character.display_name == "some updated display_name"
      assert character.featured_image == "some updated featured_image"
      assert character.icon == "some updated icon"
      assert character.name == "some updated name"
      assert character.secondary_id == "some updated secondary_id"
    end

    test "update_character/2 with invalid data returns error changeset" do
      character = character_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_character(character, @invalid_attrs)
      assert character == Core.get_character!(character.id)
    end

    test "delete_character/1 deletes the character" do
      character = character_fixture()
      assert {:ok, %Character{}} = Core.delete_character(character)
      assert_raise Ecto.NoResultsError, fn -> Core.get_character!(character.id) end
    end

    test "change_character/1 returns a character changeset" do
      character = character_fixture()
      assert %Ecto.Changeset{} = Core.change_character(character)
    end
  end
end
