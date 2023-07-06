import Config

config :pleroma, Pleroma.Web.Endpoint,
  secret_key_base: "XF540QDhtZibc7qnNEwNypmCsSl8MBhFqZemJp7ZjwzietFqU4e5TVvfLALnzEfe",
  signing_salt: "P767z96P",
  live_view: [signing_salt: "okLxNXbe"]

config :web_push_encryption, :vapid_details,
  public_key: "BLIAX85_qNvb8D4cgdK8QCVuVeX8D7JYte8g-CdwHB56-3n-vdVZkrKh67Rojx1wyt7w2EBIDKX8ResS3Xr8CRU",
  private_key: "1Smi0OOCvXty8TcCiht38TiD2b6OlVQevYNAeWhOon8"

config :pleroma, Pleroma.Repo,
  username: "pleroma",
  password: "pleroma",
  database: "pleroma",
  hostname: "db"

config :joken, default_signer: "OuInzhNJ1NjE1rSyvUb2ULNpPIIGTCfjitA9jgsXA/2MUhcXzlsfZ2eEgw3TT3rU"
