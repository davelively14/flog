defmodule Flog.Repo.Migrations.CreateCommentRating do
  use Ecto.Migration

  def change do
    create table(:comment_ratings) do
      add :positive, :boolean, default: true
      add :user_id, references(:users)
      add :comment_id, references(:comments)

      timestamps
    end

    create index(:comment_ratings, [:user_id, :comment_id])
  end
end
