defmodule Legably.Router do
  use Legably.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Legably.Auth, repo: Legably.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Legably do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", AboutController, :index
    get "/login", LoginController, :index
    get "/privacy", PrivacyController, :index
    get "/terms", TermsController, :show
    resources "/users", UserController, only: [:index, :show, :new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Legably do
  #   pipe_through :api
  # end
end
