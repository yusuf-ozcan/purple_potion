defmodule ElixirTaskManager.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # --- PROJECT 1: Counter & Monitoring ---
      # Background worker with initial state 0
      {SimpleWorker, 0},
      # Web server on Port 4000
      {Plug.Cowboy, scheme: :http, plug: ElixirTaskManager.Router, options: [port: 4000]},

      # --- PROJECT 2: Purple Exchange API ---
      # Exchange server to manage currency data
      {PurpleExchange.Server, []},
      # API access on a DIFFERENT Port: 4001
      {Plug.Cowboy, scheme: :http, plug: PurpleExchange.Router, options: [port: 4001]}
    ]

    # Strategy :one_for_one means if one process crashes, only that one is restarted.
    opts = [strategy: :one_for_one, name: ElixirTaskManager.Supervisor]
    Supervisor.start_link(children, opts)
  end
end