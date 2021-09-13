defmodule ApiWeb.LocationsControllerTest do
  use ApiWeb.ConnCase

  alias Api.Journey
  alias Api.Journey.Locations

  @create_attrs %{
    description: "some description",
    favorite: true,
    latitude: "some latitude",
    longitude: "some longitude",
    name: "some name",
    tag: "some tag",
  }
  @update_attrs %{
    description: "some updated description",
    favorite: false,
    latitude: "some updated latitude",
    longitude: "some updated longitude",
    name: "some updated name",
    tag: "some updated tag"
  }
  @invalid_attrs %{description: nil, favorite: nil, latitude: nil, longitude: nil, name: nil, tag: nil}

  def fixture(:locations) do
    {:ok, locations} = Journey.create_locations(@create_attrs)
    locations
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all locations", %{conn: conn} do
      conn = get(conn, Routes.locations_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create locations" do
    test "renders locations when data is valid", %{conn: conn} do
      conn = post(conn, Routes.locations_path(conn, :create), locations: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.locations_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "favorite" => true,
               "latitude" => "some latitude",
               "longitude" => "some longitude",
               "name" => "some name",
               "tag" => "some tag"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.locations_path(conn, :create), locations: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update locations" do
    setup [:create_locations]

    test "renders locations when data is valid", %{conn: conn, locations: %Locations{id: id} = locations} do
      conn = put(conn, Routes.locations_path(conn, :update, locations), locations: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.locations_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "favorite" => false,
               "latitude" => "some updated latitude",
               "longitude" => "some updated longitude",
               "name" => "some updated name",
               "tag" => "some updated tag"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, locations: locations} do
      conn = put(conn, Routes.locations_path(conn, :update, locations), locations: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete locations" do
    setup [:create_locations]

    test "deletes chosen locations", %{conn: conn, locations: locations} do
      conn = delete(conn, Routes.locations_path(conn, :delete, locations))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.locations_path(conn, :show, locations))
      end
    end
  end

  defp create_locations(_) do
    locations = fixture(:locations)
    %{locations: locations}
  end
end
