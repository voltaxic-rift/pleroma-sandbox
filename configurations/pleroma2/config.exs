# Pleroma instance configuration

# NOTE: This file should not be committed to a repo or otherwise made public
# without removing sensitive information.

import Config

config :pleroma, Pleroma.Web.Endpoint,
   url: [host: "pleroma2.local", scheme: "https", port: 443],
   http: [ip: {127, 0, 0, 1}, port: 4000],
   secret_key_base: "XF540QDhtZibc7qnNEwNypmCsSl8MBhFqZemJp7ZjwzietFqU4e5TVvfLALnzEfe",
   live_view: [signing_salt: "okLxNXbe"],
   signing_salt: "P767z96P"

config :pleroma, :instance,
  name: "pleroma2.local",
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
  public_key: "BLIAX85_qNvb8D4cgdK8QCVuVeX8D7JYte8g-CdwHB56-3n-vdVZkrKh67Rojx1wyt7w2EBIDKX8ResS3Xr8CRU",
  private_key: "1Smi0OOCvXty8TcCiht38TiD2b6OlVQevYNAeWhOon8"

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

config :joken, default_signer: "OuInzhNJ1NjE1rSyvUb2ULNpPIIGTCfjitA9jgsXA/2MUhcXzlsfZ2eEgw3TT3rU"

config :pleroma, configurable_from_database: true

config :pleroma, Pleroma.Upload, filters: [Pleroma.Upload.Filter.Exiftool.StripLocation, Pleroma.Upload.Filter.Exiftool.ReadDescription]
