defmodule Rollcall.Presence do
  use Phoenix.Presence, otp_app: :rollcall, pubsub_server: Rollcall.PubSub
end
