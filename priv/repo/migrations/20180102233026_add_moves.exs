defmodule Engarde.Repo.Migrations.AddMoves do
  use Ecto.Migration

  def change do
    create table("moves") do
      add(:name, :string)
      add(:input, :string)
      add(:startup, :integer)
      add(:active, :integer)
      add(:recovery, :integer)
      add(:block_advantage, :integer)
      add(:hit_advantage, :integer)
      add(:cancel, :integer)
      add(:movetype, :string)
      add(:damage, :float)
      add(:block_damage, :float)
      add(:character_id, references(:characters))

      timestamps()
    end

    create(index("moves", [:name]))
  end
end
