# Pleroma instance configuration

# NOTE: This file should not be committed to a repo or otherwise made public
# without removing sensitive information.

import Config

config :pleroma, Pleroma.Web.Endpoint,
   url: [host: "pleroma3.local", scheme: "https", port: 443],
   http: [ip: {127, 0, 0, 1}, port: 4000],
   secret_key_base: "AIBuU+U0IjqvkWz0aADnw9P3ah9KWXKDoRtZVbL8SaFEWPCN7w2TFj29CAX2l0Bb",
   live_view: [signing_salt: "ForL4ArB"],
   signing_salt: "C8rToJWe"

config :pleroma, :instance,
  name: "pleroma3.local",
  email: "fuck@example.jp",
  notify_email: "fuck@example.jp",
  limit: 5000,
  registrations_open: true

config :pleroma, :media_proxy,
  enabled: false,
  redirect_on_failure: true
  #base_url: "https://cache.pleroma.social"

config :pleroma, Pleroma.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "pleroma",
  password: "pleroma",
  database: "pleroma",
  hostname: "db"

# Configure web push notifications
config :web_push_encryption, :vapid_details,
  subject: "mailto:fuck@example.jp",
  public_key: "BMLFiXKm33tS6yUnnl8371HT6CiRrUjbNzoR7ycEHzjJkwwMot2Gf5f8bJzINrGhWn1588pH4Ou7uuFw-TjV9UU",
  private_key: "rgZ2_6K3Qr_GLAqLW1w76Y0nMPRp8d_pX9nxFlWlE_A"

config :pleroma, :database, rum_enabled: true
config :pleroma, :instance, static_dir: "/var/lib/pleroma/static"
config :pleroma, Pleroma.Uploaders.Local, uploads: "/var/lib/pleroma/uploads"

# Enable Strict-Transport-Security once SSL is working:
# config :pleroma, :http_security,
#   sts: true

# Configure S3 support if desired.
# The public S3 endpoint (base_url) is different depending on region and provider,
# consult your S3 provider's documentation for details on what to use.
#
# config :pleroma, Pleroma.Upload,
#  uploader: Pleroma.Uploaders.S3,
#  base_url: "https://s3.amazonaws.com"
#
# config :pleroma, Pleroma.Uploaders.S3,
#   bucket: "some-bucket",
#   bucket_namespace: "my-namespace",
#   truncated_namespace: nil,
#   streaming_enabled: true
#
# Configure S3 credentials:
# config :ex_aws, :s3,
#   access_key_id: "xxxxxxxxxxxxx",
#   secret_access_key: "yyyyyyyyyyyy",
#   region: "us-east-1",
#   scheme: "https://"
#
# For using third-party S3 clones like wasabi, also do:
# config :ex_aws, :s3,
#   host: "s3.wasabisys.com"

config :joken, default_signer: "W5o/4PS0tbhaL67T6Ys3tpIYd+TKfd8WoiWysy04bCO/lQIhiJt7+JfZ+usgI/QP"

config :pleroma, configurable_from_database: true

config :pleroma, Pleroma.Upload, filters: [Pleroma.Upload.Filter.Exiftool.StripLocation, Pleroma.Upload.Filter.Exiftool.ReadDescription]
