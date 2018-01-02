defmodule Engarde.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add(:title, :string)
      add(:publisher, :string)
      add(:release_date, :date)

      timestamps()
    end
  end
end
