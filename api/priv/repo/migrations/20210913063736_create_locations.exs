defmodule Api.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :description, :text
      add :tag, :string
      add :favorite, :boolean, default: false, null: false
      add :latitude, :string
      add :longitude, :string

      timestamps()
    end

  end
end
