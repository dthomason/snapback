defmodule Api.Journey do
  @moduledoc """
  The Journey context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Journey.Locations

  def list_locations do
    Repo.all(Locations)
  end

  def get_locations!(id), do: Repo.get!(Locations, id)


  def create_locations(attrs \\ %{}) do
    %Locations{}
    |> Locations.changeset(attrs)
    |> Repo.insert()
  end


  def update_locations(%Locations{} = locations, attrs) do
    locations
    |> Locations.changeset(attrs)
    |> Repo.update()
  end


  def delete_locations(%Locations{} = locations) do
    Repo.delete(locations)
  end


  def change_locations(%Locations{} = locations, attrs \\ %{}) do
    Locations.changeset(locations, attrs)
  end
end
