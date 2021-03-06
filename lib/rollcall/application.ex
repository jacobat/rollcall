defmodule Rollcall.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Rollcall.Repo,
      # Start the Telemetry supervisor
      RollcallWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Rollcall.PubSub},
      # Start presence
      Rollcall.Presence,
      # Start the Endpoint (http/https)
      RollcallWeb.Endpoint
      # Start a worker by calling: Rollcall.Worker.start_link(arg)
      # {Rollcall.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rollcall.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RollcallWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
