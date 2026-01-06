defmodule WebRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    # SimpleWorker'ın tuttuğu son sayıyı dosyadan okuyalım (şimdilik en kolayı bu)
    current_count = File.read!("counter.txt")
    
    send_resp(conn, 200, "<h1>Selam Backend Dunyasi!</h1><p>Guncel Sayac: #{current_count}</p>")
  end

  match _ do
    send_resp(conn, 404, "Aradiginiz sayfa bulunamadi.")
  end
end