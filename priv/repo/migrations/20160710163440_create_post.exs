defmodule Flog.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false
      add :user_id, references(:users)

      timestamps
    end

    create unique_index(:posts, [:title])
    create index(:posts, [:user_id])
  end
end
