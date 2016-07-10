defmodule Flog.CommentRating do
  use Flog.Web, :model

  schema "comment_ratings" do
    field :positive, :boolean, default: true
    belongs_to :user, Flog.User
    belongs_to :comment, Flog.Comment

    timestamps
  end

  @required_fields ~w(user_id comment_d)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
