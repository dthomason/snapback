defmodule ApiWeb.LocationsController do
  use ApiWeb, :controller

  alias Api.Journey
  alias Api.Journey.Locations

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    locations = Journey.list_locations()
    render(conn, "index.json", locations: locations)
  end

  def create(conn, %{"locations" => locations_params}) do
    with {:ok, %Locations{} = locations} <- Journey.create_locations(locations_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.locations_path(conn, :show, locations))
      |> render("show.json", locations: locations)
    end
  end

  def show(conn, %{"id" => id}) do
    locations = Journey.get_locations!(id)
    render(conn, "show.json", locations: locations)
  end

  def update(conn, %{"id" => id, "locations" => locations_params}) do
    locations = Journey.get_locations!(id)

    with {:ok, %Locations{} = locations} <- Journey.update_locations(locations, locations_params) do
      render(conn, "show.json", locations: locations)
    end
  end

  def delete(conn, %{"id" => id}) do
    locations = Journey.get_locations!(id)

    with {:ok, %Locations{}} <- Journey.delete_locations(locations) do
      send_resp(conn, :no_content, "")
    end
  end
end
