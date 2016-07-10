defmodule Flog.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :email, :string
      add :display_name, :string

      timestamps
    end

    create unique_index(:users, [:username])
  end
end
