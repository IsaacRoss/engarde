defmodule EngardeWeb.Router do
  use EngardeWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(EngardeWeb.UserAuthController, repo: Engarde.Repo)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug(:fetch_session)
    plug(EngardeWeb.UserAuthController, repo: Engarde.Repo)
  end

  scope "/", EngardeWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    resources("/users", UserController)
    resources("/sessions", SessionController, only: [:new, :create, :delete])
  end

  # Other scopes may use custom stacks.
  scope "/api", EngardeWeb do
    pipe_through(:api)
  end
end
