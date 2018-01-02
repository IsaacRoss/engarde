defmodule Engarde.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add(:name, :string)
      add(:bio, :string)
      add(:health, :integer)
      add(:strength, :integer)
      add(:ability, :integer)
      add(:defense, :integer)

      timestamps()
    end
  end
end
