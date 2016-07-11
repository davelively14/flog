defmodule Flog.UserController do
  use Flog.Web, :controller
  alias Flog.User
  alias Flog.Repo
  import Flog.ControllerHelpers, only: [get_referer: 1]

  def new(conn, _params) do
    changeset = %User{} |> User.changeset
    render conn, "new.html", changeset: changeset, back: get_referer(conn)
  end

  def create(conn, %{"user" => params}) do
    changeset = %User{} |> User.registration_changeset(params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User #{user.username} created")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset, back: page_path(conn, :index)
    end
  end

  def index(conn, _params) do
    users = User |> Repo.all
    render conn, "index.html", users: users, back: get_referer(conn)
  end

  def delete(conn, %{"id" => id}) do
    user = User |> Repo.get(id)
    Repo.delete user
    redirect(conn, to: user_path(conn, :index))
  end
end
