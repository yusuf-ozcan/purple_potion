defmodule PurpleExchange.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/rates" do
    # Server'dan güncel veriyi iste
    data = PurpleExchange.Server.get_rates()

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(data))
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end