defmodule MyTest.FooView do
  use MyTest.Web, :view

  def render("index.json", %{foos: foos}) do
    %{data: render_many(foos, MyTest.FooView, "foo.json")}
  end

  def render("show.json", %{foo: foo}) do
    %{data: render_one(foo, MyTest.FooView, "foo.json")}
  end

  def render("foo.json", %{foo: foo}) do
    %{id: foo.id}
  end
end
