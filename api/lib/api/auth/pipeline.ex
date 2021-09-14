defmodule ApiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :api,
    module: ApiWeb.Auth.Guardian,
    error_handler: ApiWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
