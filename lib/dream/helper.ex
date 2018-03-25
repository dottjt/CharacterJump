defmodule Dream.Helper do
  use Ecto.Schema
  
  import Ecto.Changeset
  import Ecto.Query, warn: false
  
  alias Dream.Repo
  
  def display_name_convert(display_name) do
      if display_name do
      encoding = URI.encode(display_name)
                      |> String.replace("%20", "-") 

      Regex.replace(~r/!|\$|@|#|%|^|\*|&|\^/, encoding, "")
      end
  end

  def generate_secondary_id() do
    Ecto.UUID.generate
      |> String.split("-")
      |> hd()
  end

end