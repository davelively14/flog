defmodule Flog.SessionController do
  use Flog.Web, :controller
  alias Flog.Auth
  alias Flog.Repo

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    case Auth.login_by_username_and_password(conn, username, password, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "#{username} logged in")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username/password")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> Auth.logout
    |> redirect(to: page_path(conn, :index))
  end
end
