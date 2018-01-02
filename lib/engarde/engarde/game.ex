defmodule Engarde.Engarde.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias Engarde.Engarde.Game

  schema "games" do
    field(:title, :string)
    field(:publisher, :string)
    field(:release_date, :date)

    timestamps()
  end

  @doc false
  def changeset(%Game{} = game, attrs) do
    game
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
