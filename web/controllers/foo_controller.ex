defmodule MyTest.FooController do
  use MyTest.Web, :controller
  require Logger

  def do_invoice(conn, params) do

    case HTTPoison.put(params["callback_url"], params["payload"]) do
      {:ok, response} ->
        Logger.info "#{__MODULE__}: Transaction to #{inspect params["callback_url"]} with #{inspect params["payload"]} complete."
        json(conn, "ok")
      {:error, reason} ->
        Logger.error "#{__MODULE__}: Transaction to #{inspect params["callback_url"]} with #{inspect params["payload"]} failed."
        json(conn, "error")
    end

  end
end
