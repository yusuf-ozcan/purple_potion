defmodule ElixirTaskManager.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    # SimpleWorker'dan güncel değeri çekiyoruz
    current_count = SimpleWorker.get_current_value()
    
    html_content = """
    <html>
      <head><title>Elixir Monitor</title></head>
      <body style="font-family: sans-serif; text-align: center; margin-top: 50px;">
        <h1>Elixir Arka Plan Iscisi</h1>
        <p style="font-size: 24px;">Guncel Sayac Degeri: <strong>#{current_count}</strong></p>
        <p>Sayfayi yenileyerek degisimi gorebilirsin.</p>
      </body>
    </html>
    """

    send_resp(conn, 200, html_content)
  end

  match _ do
    send_resp(conn, 404, "Bulunamadi")
  end
end