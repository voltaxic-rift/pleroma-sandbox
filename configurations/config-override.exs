import Config

config :pleroma, :instance,
  healthcheck: true

config :pleroma, Pleroma.Emails.Mailer,
  adapter: Swoosh.Adapters.Local

