defmodule DreamWeb.AppController do
  use DreamWeb, :controller

  alias Dream.Core
  alias Dream.Core.Character

  def app(conn, %{"any" => any}) do

    Coherence.current_user_name(conn)

    render conn, "dashboard.html"
  end

  def initial_state(conn, _params) do
    # this needs to get user state from coherence. 

    user = Coherence.current_user(conn)

    timeline = 
      Core.list_days_assoc()
        # |> Enum.map(fn day ->  end)

    characters = Core.list_characters_assoc()
    narratives = Dream.Character.list_narratives()
    journals = Dream.Character.list_journals()
    traits = Dream.Character.list_traits()

    # strftime_str = Timex.format!(datetime, "%y-%m-%d %H:%M", :strftime) # "%Y-%m-%d %H:%M:%S"
    render conn, DreamWeb.AppView, "initial_state.json", timeline: timeline, characters: characters, traits: traits, narratives: narratives, journals: journals, user: user
  end
end