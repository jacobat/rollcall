defmodule Rollcall.Repo do
  use Ecto.Repo,
    otp_app: :rollcall,
    adapter: Ecto.Adapters.Postgres
end
