use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :legably, Legably.Endpoint,
  secret_key_base: "JPOIE44kJL3QTcMuzdLvstb4iZnslOTPVdROCMB8Yw+c0QnoOaWdP/QWxnORTlU9"

# Configure your database
config :legably, Legably.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "legably_prod",
  pool_size: 20
