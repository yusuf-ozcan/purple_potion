defmodule LinkMonitor do
  use GenServer

  # --- Client API ---
  def start_link(urls) when is_list(urls) do
    GenServer.start_link(__MODULE__, urls, name: __MODULE__)
  end

  # --- Server Callbacks ---
  @impl true
  def init(urls) do
    send(self(), :check)
    {:ok, urls}
  end

  @impl true
  def handle_info(:check, urls) do
    # Log dosyasına kontrolün başladığını işaretleyelim
    log_result("--- Kontrol Başlatılıyor ---")

    urls
    |> Enum.each(fn url -> spawn(fn -> check_url(url) end) end)

    Process.send_after(self(), :check, 30_000)
    {:noreply, urls}
  end

  # --- Yardımcı Fonksiyonlar ---

  defp check_url(url) do
    case HTTPoison.get(url) do
      {:ok, %{status_code: 200}} ->
        log_result("✅ UP: #{url}")
      {:ok, %{status_code: code}} ->
        log_result("⚠️ ISSUE (#{code}): #{url}")
      {:error, %{reason: reason}} ->
        log_result("❌ DOWN: #{url} - Sebep: #{inspect(reason)}")
    end
  end

  defp log_result(message) do
    timestamp = DateTime.utc_now() |> DateTime.to_string()
    # [:append] modu dosyanın üzerine yazmaz, sonuna ekleme yapar.
    File.write("link_reports.log", "#{timestamp} - #{message}\n", [:append])
  end
end