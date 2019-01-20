defmodule DataDashWeb.Router do
  use DataDashWeb, :router

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


  scope "/", DataDashWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/logout", AuthController, :logout
    resources "/users", UserController
  end

  scope "/auth", DataDashWeb do
    pipe_through :browser
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", DataDashWeb do
  #   pipe_through :api
  # end
end
