defmodule SwaggerLibTest.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :email, :string, null: false

      timestamps()
    end
  end
end
