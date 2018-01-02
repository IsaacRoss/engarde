defmodule Engarde.Engarde.Character do
  use Ecto.Schema
  import Ecto.Changeset
  alias Engarde.Engarde.Character
  alias Engarde.Engarde.Move

  schema "characters" do
    field(:bio, :string)
    field(:name, :string)
    field(:health, :integer)
    field(:strength, :integer)
    field(:ability, :integer)
    field(:defense, :integer)
    has_many(:moves, Move)

    timestamps()
  end

  @doc false
  def changeset(%Character{} = character, attrs) do
    character
    |> cast(attrs, [:name, :bio, :health, :strength, :ability, :defense])
    |> validate_required([:name])
  end
end
