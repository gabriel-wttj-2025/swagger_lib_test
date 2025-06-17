defmodule SwaggerLibTest.Repo do
  use Ecto.Repo,
    otp_app: :swagger_lib_test,
    adapter: Ecto.Adapters.Postgres
end
