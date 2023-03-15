defmodule OKWrite.Repo do
  use Ecto.Repo,
    otp_app: :okwrite,
    adapter: Ecto.Adapters.Postgres
end
