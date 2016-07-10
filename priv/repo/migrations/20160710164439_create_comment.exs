defmodule Flog.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :text, null: false
      add :paragraph_id, references(:paragraphs)
      add :user_id, references(:users)

      timestamps
    end

    create index(:comments, [:user_id, :paragraph_id])
  end
end
