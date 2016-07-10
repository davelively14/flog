defmodule Flog.Repo.Migrations.CreateParagraph do
  use Ecto.Migration

  def change do
    create table(:paragraphs) do
      add :body, :text, null: false
      add :post_id, references(:posts)

      timestamps
    end

    create index(:paragraphs, [:post_id])
  end
end
