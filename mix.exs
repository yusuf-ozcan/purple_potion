defmodule ElixirTaskManager.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_task_manager,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Uygulama başladığında hangi modüllerin çalışacağını belirler
  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirTaskManager.Application, []} # Uygulama giriş noktası
    ]
  end

  # Projenin bağımlılıkları (Kütüphaneler)
  defp deps do
    [
      {:httpoison, "~> 2.0"},    # HTTP istekleri göndermek için
      {:plug_cowboy, "~> 2.6"}   # Web sunucusu oluşturmak için
    ]
  end
end