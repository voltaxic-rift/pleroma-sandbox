import Config

config :pleroma, Pleroma.Web.Endpoint,
  secret_key_base: "+eyRmJ+kUUL2VlQzyQGmiF/CT27pMkrm3iSxjKlHqyeTiUdWCbzzGirTju2DhF2o",
  signing_salt: "Aav+PBJl",
  live_view: [signing_salt: "Y76Z8KFy"]

config :web_push_encryption, :vapid_details,
  public_key: "BJ0MvgBMa-SKn4AEvLc4Qz-vuLLr5mRdn_INBVEG4lDhq54ZzLnIvxAlHQaKACfi-TfTnbmcWsLkQa3Mh8U3dus",
  private_key: "QDSQLQgvoidcU-soZnMuwqagibUD76Ihdpm4ZyQ-CFs"

config :pleroma, Pleroma.Repo,
  username: "pleroma",
  password: "pleroma",
  database: "pleroma",
  hostname: "db"

config :joken, default_signer: "b7FBKcee9Le0jxN9mhv+dynQkSZbQoiqqRepuXgRsSx9LxkRc+KAXDfRL+44weLK"
