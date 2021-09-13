# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Api.Repo.insert!(%Api.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Api.Repo
alias Api.Journey.Locations

Repo.insert! %Locations{
  name: "Rainbow Pools",
  description: "Beautiful waterfall ...",
  tag: "#getaway",
  favorite: true,
  latitude: "41.40338",
  longitude: "2.17403"
}
Repo.insert! %Locations{
  name: "Hawaii",
  description: "Turtles!!!",
  tag: "#livingmybestlife",
  favorite: false,
  latitude: "12.40438",
  longitude: "45.17403"
}
Repo.insert! %Locations{
  name: "Jamaica",
  description: "Breathtaking",
  tag: "#amazed",
  favorite: true,
  latitude: "33.40338",
  longitude: "22.17403"
}
