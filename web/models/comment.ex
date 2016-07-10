defmodule Flog.Comment do
  use Flog.Web, :model

  schema "comments" do
    field :body, :text
    belongs_to :user, Flog.User
    belongs_to :paragraph, Flog.Paragraph

    timestamps
  end

  @required_fields ~w(body user_id paragraph_id)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:body, min: 1)
  end
end
