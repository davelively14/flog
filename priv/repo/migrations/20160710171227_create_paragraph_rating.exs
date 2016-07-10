defmodule Flog.Repo.Migrations.CreateParagraphRating do
  use Ecto.Migration

  def change do
    create table(:paragraph_ratings) do
      add :positive, :boolean, default: true
      add :user_id, references(:users)
      add :paragraph_id, references(:paragraphs)

      timestamps
    end

    create index(:paragraph_ratings, [:user_id, :paragraph_id])
  end
end
