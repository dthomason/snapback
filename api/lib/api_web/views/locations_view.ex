defmodule ApiWeb.LocationsView do
  use ApiWeb, :view
  alias ApiWeb.LocationsView

  def render("index.json", %{locations: locations}) do
    %{data: render_many(locations, LocationsView, "locations.json")}
  end

  def render("show.json", %{locations: locations}) do
    %{data: render_one(locations, LocationsView, "locations.json")}
  end

  def render("locations.json", %{locations: locations}) do
    %{id: locations.id,
      name: locations.name,
      description: locations.description,
      tag: locations.tag,
      favorite: locations.favorite,
      latitude: locations.latitude,
      longitude: locations.longitude,
      date: NaiveDateTime.to_string(locations.inserted_at)
    }
  end
end
