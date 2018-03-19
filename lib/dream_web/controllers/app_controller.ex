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

    user = Coherence.current_user_name(conn)
    IO.inspect user

    timeline = 
      Core.list_days_assoc()
        # |> Enum.map(fn day ->  end)

    characters = Core.list_characters_assoc()

    # strftime_str = Timex.format!(datetime, "%y-%m-%d %H:%M", :strftime) # "%Y-%m-%d %H:%M:%S"


    render conn, DreamWeb.AppView, "initial_state.json", timeline: timeline, characters: characters
  end
end