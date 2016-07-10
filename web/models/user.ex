defmodule Flog.User do
  use Flog.Web, :model

  schema "users" do
    field :username, :string
    field :display_name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    has_many :posts, Flog.Post

    timestamps
  end

  @required_fields ~w(username display_name)
  @optional_fields ~w(email)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:username, min: 1, max: 20)
    |> validate_length(:display_name, min: 1, max: 30)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:username)
  end

  @doc """
  This function calls the standard changeset, but will also convert the
  password to an encrypted hash. The private function put_pass_hash is called,
  which checks to ensure changeset is both valid and the password is being
  changed. If the password is included, it will use that virtual field to
  create the stored password_hash field using Bcrypt via the Comeonin function
  hashpwsalt.
  """
  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
