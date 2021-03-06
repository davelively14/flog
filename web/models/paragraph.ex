defmodule Flog.Paragraph do
  use Flog.Web, :model

  schema "paragraphs" do
    field :body, :string
    belongs_to :post, Flog.Post
    has_many :comments, Flog.Comment
    has_many :paragraph_ratings, Flog.ParagraphRating

    timestamps
  end

  @required_fields ~w(body post_id)
  @optional_fields ~w()

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:body, min: 1)
  end
end
