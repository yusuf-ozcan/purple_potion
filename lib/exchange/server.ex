defmodule PurpleExchange.Server do
  use GenServer

  # API URL (Örnek bir ücretsiz API)
  @api_url "https://api.exchangerate-api.com/v4/latest/USD"

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @impl true
  def init(_) do
    # İlk veriyi çekmek için mesaj gönder
    send(self(), :fetch_rates)
    {:ok, %{rates: %{}, last_update: nil}}
  end

  @impl true
  def handle_info(:fetch_rates, _state) do
    IO.puts("🌐 Döviz kurları güncelleniyor...")
    
    case HTTPoison.get(@api_url) do
      {:ok, %{status_code: 200, body: body}} ->
        new_data = Jason.decode!(body)
        # 1 saat sonra tekrar güncelle
        Process.send_after(self(), :fetch_rates, 3600_000)
        {:noreply, %{rates: new_data["rates"], last_update: DateTime.utc_now()}}
        
      _ ->
        # Hata olursa 10 saniye sonra tekrar dene
        Process.send_after(self(), :fetch_rates, 10_000)
        {:noreply, %{rates: %{}, last_update: "Hata oluştu"}}
    end
  end

  # Dışarıdan veriyi okumak için fonksiyon
  def get_rates do
    GenServer.call(__MODULE__, :get_rates)
  end

  @impl true
  def handle_call(:get_rates, _from, state) do
    {:reply, state, state}
  end
end