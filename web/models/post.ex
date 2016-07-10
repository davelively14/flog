defmodule Flog.Post do
  use Flog.Web, :model

  schema "posts" do
    field :title, :string
    belongs_to :user, Flog.User

    timestamps
  end

  @required_fields ~w(title user_id)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:title, min: 1, max: 100)
  end
end
