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
    plug :fetch_session    
    plug Coherence.Authentication.Session     
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
    get "/guides", PageController, :guides    
    get "/community", PageController, :community

  end

  # Other scopes may use custom stacks.
  scope "/api", DreamWeb do
    pipe_through :api

    get "/initial_state", AppController, :initial_state

    resources "/days", DayController, except: [:new, :edit]
    resources "/characters", CharacterController, except: [:new, :edit]
    resources "/descriptions", DescriptionController, except: [:new, :edit]
    resources "/journals", JournalController, except: [:new, :edit]
    resources "/additional_descriptions", AdditionalDescriptionController, except: [:new, :edit]
    resources "/traits", TraitController, except: [:new, :edit]
    resources "/trait_categories", TraitCategoryController, except: [:new, :edit]
    resources "/narratives", NarrativeController, except: [:new, :edit]
  end

  scope "/dashboard", DreamWeb do 
    pipe_through :protected

    get "/", PageController, :dashboard
    get "/:any", PageController, :dashboard
    get "/:any/:any", PageController, :dashboard
    get "/:any/:any/:any", PageController, :dashboard

  end

end
