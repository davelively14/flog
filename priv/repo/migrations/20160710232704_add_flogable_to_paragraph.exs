defmodule Flog.Repo.Migrations.AddFlogableToParagraph do
  use Ecto.Migration

  def change do
    alter table(:paragraphs) do
      add :flogable, :boolean, default: false
    end
  end
end
