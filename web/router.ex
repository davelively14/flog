defmodule Flog.Router do
  use Flog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Flog do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/users/new", UserController, :new
    post "/users", UserController, :create
    get "/users", UserController, :index
    delete "/users/:id", UserController, :delete
  end

  scope "/flog", Flog do
    pipe_through [:browser]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Flog do
  #   pipe_through :api
  # end
end
