# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dream,
  ecto_repos: [Dream.Repo]

# Configures the endpoint
config :dream, DreamWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PQvjnTmrEMgmvJWFEIABbwElEdXb0wBuhCUFk0z7W7+ifE5MgjgZVgJxY1pvJOHI",
  render_errors: [view: DreamWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Dream.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"



# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Dream.Coherence.User,
  repo: Dream.Repo,
  module: Dream,
  web_module: DreamWeb,
  router: DreamWeb.Router,
  messages_backend: DreamWeb.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: "Julius Reade",
  email_from_email: "julius.reade@gmail.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]

config :coherence, DreamWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
