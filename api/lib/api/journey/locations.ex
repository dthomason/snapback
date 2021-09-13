defmodule Api.Journey.Locations do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :description, :string
    field :favorite, :boolean, default: false
    field :latitude, :string
    field :longitude, :string
    field :name, :string
    field :tag, :string

    timestamps()
  end

  @doc false
  def changeset(locations, attrs) do
    locations
    |> cast(attrs, [:name, :description, :tag, :favorite, :latitude, :longitude])
    |> validate_required([:name, :description, :tag, :favorite, :latitude, :longitude])
  end
end
