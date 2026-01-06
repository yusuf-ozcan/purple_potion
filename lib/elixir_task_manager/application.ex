defmodule ElixirTaskManager.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # 1. Sayaç İşçisi (Başlangıç değeri 0)
      {SimpleWorker, 0},
      
      # 2. Web Sunucusu (Port 4000)
      {Plug.Cowboy, scheme: :http, plug: ElixirTaskManager.Router, options: [port: 4000]}
    ]

    # Gözetim stratejisi: Biri çökerse sadece o yeniden başlasın
    opts = [strategy: :one_for_one, name: ElixirTaskManager.Supervisor]
    Supervisor.start_link(children, opts)
  end
end