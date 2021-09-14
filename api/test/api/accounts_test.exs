defmodule Api.AccountsTest do
  use Api.DataCase

  alias Api.Accounts

  # describe "users" do
  #   alias Api.Accounts.User

  #   @valid_attrs %{email: "some@email.com", password: "some password"}
  #   @update_attrs %{email: "some@newemail.com", encrypted_password: "some updated password"}
  #   @invalid_attrs %{email: nil, password: nil}

  #   def user_fixture(attrs \\ %{}) do
  #     {:ok, user} =
  #       attrs
  #       |> Enum.into(@valid_attrs)
  #       |> Accounts.create_user()

  #     user
  #   end

  #   test "list_users/0 returns all users" do
  #     {:ok, %User{} = user} = user_fixture()

  #     assert Accounts.list_users() == [user.email == "some@email.com"]
  #   end

  #   test "get_user!/1 returns the user with given id" do
  #     {:ok, %User{} = user} = user_fixture()
  #     assert Accounts.get_user!(user.id) == user.email === "some@email.com"
  #   end

  #   test "create_user/1 with valid data creates a user" do
  #     assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
  #     assert user.email == "some@email.com"
  #     assert user.encrypted_password
  #     assert user.password == "some password"
  #   end

  #   test "create_user/1 with invalid data returns error changeset" do
  #     assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
  #   end

  #   test "update_user/2 with valid data updates the user" do
  #     user = user_fixture()
  #     assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
  #     assert user.email == "some@newemail.com"
  #   end

  #   # test "update_user/2 with invalid data returns error changeset" do
  #   #   user = user_fixture()
  #   #   assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
  #   #   assert user == Accounts.get_user!(user)
  #   # end

  #   test "delete_user/1 deletes the user" do
  #     user = user_fixture()
  #     assert {:ok, %User{}} = Accounts.delete_user(user)
  #     assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
  #   end

  #   test "change_user/1 returns a user changeset" do
  #     user = user_fixture()
  #     assert %Ecto.Changeset{} = Accounts.change_user(user)
  #   end
  # end
end
