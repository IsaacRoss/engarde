defmodule Engarde.AccountsTest do
  use Engarde.DataCase

  alias Engarde.Accounts

  describe "users" do
    alias Engarde.Accounts.User

    @valid_attrs %{
      email: "me@you.com",
      password: "1234567",
      password_confirmation: "1234567",
      username: "some username"
    }
    @update_attrs %{
      email: "me@updated.com",
      password: "1234567",
      username: "some updated username"
    }
    @invalid_attrs %{email: nil, password_hash: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end
  end
end
