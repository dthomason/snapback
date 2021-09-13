defmodule Api.Journey do
  @moduledoc """
  The Journey context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Journey.Locations

  @doc """
  Returns the list of locations.

  ## Examples

      iex> list_locations()
      [%Locations{}, ...]

  """
  def list_locations do
    Repo.all(Locations)
  end

  @doc """
  Gets a single locations.

  Raises `Ecto.NoResultsError` if the Locations does not exist.

  ## Examples

      iex> get_locations!(123)
      %Locations{}

      iex> get_locations!(456)
      ** (Ecto.NoResultsError)

  """
  def get_locations!(id), do: Repo.get!(Locations, id)

  @doc """
  Creates a locations.

  ## Examples

      iex> create_locations(%{field: value})
      {:ok, %Locations{}}

      iex> create_locations(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_locations(attrs \\ %{}) do
    %Locations{}
    |> Locations.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a locations.

  ## Examples

      iex> update_locations(locations, %{field: new_value})
      {:ok, %Locations{}}

      iex> update_locations(locations, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_locations(%Locations{} = locations, attrs) do
    locations
    |> Locations.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a locations.

  ## Examples

      iex> delete_locations(locations)
      {:ok, %Locations{}}

      iex> delete_locations(locations)
      {:error, %Ecto.Changeset{}}

  """
  def delete_locations(%Locations{} = locations) do
    Repo.delete(locations)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking locations changes.

  ## Examples

      iex> change_locations(locations)
      %Ecto.Changeset{data: %Locations{}}

  """
  def change_locations(%Locations{} = locations, attrs \\ %{}) do
    Locations.changeset(locations, attrs)
  end
end
