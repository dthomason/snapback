defmodule Api.JourneyTest do
  use Api.DataCase

  alias Api.Journey

  describe "locations" do
    alias Api.Journey.Locations

    @valid_attrs %{description: "some description", favorite: true, latitude: "some latitude", longitude: "some longitude", name: "some name", tag: "some tag"}
    @update_attrs %{description: "some updated description", favorite: false, latitude: "some updated latitude", longitude: "some updated longitude", name: "some updated name", tag: "some updated tag"}
    @invalid_attrs %{description: nil, favorite: nil, latitude: nil, longitude: nil, name: nil, tag: nil}

    def locations_fixture(attrs \\ %{}) do
      {:ok, locations} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Journey.create_locations()

      locations
    end

    test "list_locations/0 returns all locations" do
      locations = locations_fixture()
      assert Journey.list_locations() == [locations]
    end

    test "get_locations!/1 returns the locations with given id" do
      locations = locations_fixture()
      assert Journey.get_locations!(locations.id) == locations
    end

    test "create_locations/1 with valid data creates a locations" do
      assert {:ok, %Locations{} = locations} = Journey.create_locations(@valid_attrs)
      assert locations.description == "some description"
      assert locations.favorite == true
      assert locations.latitude == "some latitude"
      assert locations.longitude == "some longitude"
      assert locations.name == "some name"
      assert locations.tag == "some tag"
    end

    test "create_locations/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Journey.create_locations(@invalid_attrs)
    end

    test "update_locations/2 with valid data updates the locations" do
      locations = locations_fixture()
      assert {:ok, %Locations{} = locations} = Journey.update_locations(locations, @update_attrs)
      assert locations.description == "some updated description"
      assert locations.favorite == false
      assert locations.latitude == "some updated latitude"
      assert locations.longitude == "some updated longitude"
      assert locations.name == "some updated name"
      assert locations.tag == "some updated tag"
    end

    test "update_locations/2 with invalid data returns error changeset" do
      locations = locations_fixture()
      assert {:error, %Ecto.Changeset{}} = Journey.update_locations(locations, @invalid_attrs)
      assert locations == Journey.get_locations!(locations.id)
    end

    test "delete_locations/1 deletes the locations" do
      locations = locations_fixture()
      assert {:ok, %Locations{}} = Journey.delete_locations(locations)
      assert_raise Ecto.NoResultsError, fn -> Journey.get_locations!(locations.id) end
    end

    test "change_locations/1 returns a locations changeset" do
      locations = locations_fixture()
      assert %Ecto.Changeset{} = Journey.change_locations(locations)
    end
  end
end
