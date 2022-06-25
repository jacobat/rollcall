defmodule RollcallWeb.Components.OnlineUsers do
  use RollcallWeb, :live_component

  def update(assigns, socket) do
    {:ok,
      socket
      |> assign(assigns)
    }
  end
end
