defmodule Flog.Comment do
  use Flog.Web, :model

  schema "comments" do
    field :body, :string
    belongs_to :user, Flog.User
    belongs_to :paragraph, Flog.Paragraph
    has_many :comment_ratings, Flog.Comment

    timestamps
  end

  @required_fields ~w(body user_id paragraph_id)
  @optional_fields ~w()

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:body, min: 1)
  end
end
