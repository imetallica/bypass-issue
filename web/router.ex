defmodule MyTest.Router do
  use MyTest.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MyTest do
    pipe_through :api

    put "/invoice", FooController, :do_invoice
  end
end
