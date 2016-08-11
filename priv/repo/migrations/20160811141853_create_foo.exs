defmodule MyTest.Repo.Migrations.CreateFoo do
  use Ecto.Migration

  def change do
    create table(:foos) do

      timestamps()
    end

  end
end
