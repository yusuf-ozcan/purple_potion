defmodule SimpleWorker do
  use GenServer

  # --- Client API ---
  def start_link(initial_val) do
    GenServer.start_link(__MODULE__, initial_val, name: __MODULE__)
  end

  # Sayacın o anki değerini almak için bu fonksiyonu ekledik
  def get_current_value do
    GenServer.call(__MODULE__, :get_value)
  end

  # --- Server Callbacks ---
  @impl true
  def init(val) do
    schedule_work()
    {:ok, val}
  end

  @impl true
  def handle_call(:get_value, _from, val) do
    {:reply, val, val} # Mevcut değeri gönder
  end

  @impl true
  def handle_info(:work, val) do
    IO.puts("🔢 Sayaç: #{val}")
    schedule_work()
    {:noreply, val + 1}
  end

  defp schedule_work do
    Process.send_after(self(), :work, 1000)
  end
end