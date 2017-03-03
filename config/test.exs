use Mix.Config

config :ueberauth, Ueberauth.Strategy.Github.OAuth, []

config :ueberauth_github, :oauth2_client, TestOAuthClient
config :ueberauth_github, :oauth2_module, TestOAuth
config :ueberauth_github, :uid_field, :login
