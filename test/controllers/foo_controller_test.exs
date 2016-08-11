defmodule MyTest.FooControllerTest do
  use MyTest.ConnCase

  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    bypass = Bypass.open
    {:ok, conn: put_req_header(conn, "accept", "application/json"), bps: bypass}
  end


  test "test connection", %{conn: c, bps: b} do
    Bypass.expect b, fn conn ->
      assert "/" == conn.request_path
      assert "PUT" == conn.method
      Plug.Conn.resp(conn, 201, "ok")
    end

    c |> put("/api/invoice", %{payload: "It works!", callback_url: "http://localhost:#{b.port}"})
  end

end
