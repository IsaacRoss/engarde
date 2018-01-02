defmodule Engarde.Engarde.Move do
  use Ecto.Schema
  import Ecto.Changeset
  alias Engarde.Engarde.Move
  alias Engarde.Engarde.Character

  schema "moves" do
    field(:name, :string)
    field(:input, :string)
    field(:startup, :integer)
    field(:active, :integer)
    field(:recovery, :integer)
    field(:block_advantage, :integer)
    field(:hit_advantage, :integer)
    field(:cancel, :integer)
    field(:movetype, :string)
    field(:damage, :float)
    field(:block_damage, :float)
    belongs_to(:characters, Character)

    timestamps()
  end

  @doc false
  def changeset(%Move{} = move, attrs) do
    move
    |> cast(attrs, [
      :name,
      :input,
      :startup,
      :active,
      :recovery,
      :block_advantage,
      :hit_advantage,
      :cancel,
      :movetype,
      :damage,
      :block_damage
    ])
    |> validate_required([:name])
  end
end
