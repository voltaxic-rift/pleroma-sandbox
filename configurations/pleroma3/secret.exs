import Config

config :pleroma, Pleroma.Web.Endpoint,
  secret_key_base: "AIBuU+U0IjqvkWz0aADnw9P3ah9KWXKDoRtZVbL8SaFEWPCN7w2TFj29CAX2l0Bb",
  signing_salt: "C8rToJWe",
  live_view: [signing_salt: "ForL4ArB"]

config :web_push_encryption, :vapid_details,
  public_key: "BMLFiXKm33tS6yUnnl8371HT6CiRrUjbNzoR7ycEHzjJkwwMot2Gf5f8bJzINrGhWn1588pH4Ou7uuFw-TjV9UU",
  private_key: "rgZ2_6K3Qr_GLAqLW1w76Y0nMPRp8d_pX9nxFlWlE_A"

config :pleroma, Pleroma.Repo,
  username: "pleroma",
  password: "pleroma",
  database: "pleroma",
  hostname: "db"

config :joken, default_signer: "W5o/4PS0tbhaL67T6Ys3tpIYd+TKfd8WoiWysy04bCO/lQIhiJt7+JfZ+usgI/QP"
