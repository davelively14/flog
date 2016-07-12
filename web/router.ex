defmodule Flog.Router do
  use Flog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Flog.Auth, repo: Flog.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Flog do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/users/new", UserController, :new
    post "/users", UserController, :create
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/portfolio", PortfolioController, :index
  end

  scope "/flog", Flog do
    pipe_through [:browser, :authenticate_user]

    get "/users", UserController, :index
    delete "/users/:id", UserController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", Flog do
  #   pipe_through :api
  # end
end
