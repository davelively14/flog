defmodule Flog.ParagraphRating do
  use Flog.Web, :model

  schema "paragraph_ratings" do
    field :positive, :boolean, default: true
    belongs_to :user, Flog.User
    belongs_to :paragraph, Flog.Paragraph

    timestamps
  end

  @required_fields ~w(field user_id paragraph_id)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
