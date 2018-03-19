defmodule DreamWeb.Router do
  use DreamWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session 
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true 
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/dashboard" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", DreamWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    # get "/guides"

  end

  # Other scopes may use custom stacks.
  scope "/api", DreamWeb do
    pipe_through :api

    get "/initial_state", AppController, :initial_state

    resources "/days", DayController
    resources "/characters", CharacterController
    resources "/descriptions", DescriptionController
    resources "/journals", JournalController
    resources "/additional_descriptions", AdditionalDescriptionController
    resources "/traits", TraitController
    resources "/trait_categories", TraitCategoryController 
  end

  scope "/dashboard", DreamWeb do 
    pipe_through :protected

    get ":any", AppController, :app
  end

end
