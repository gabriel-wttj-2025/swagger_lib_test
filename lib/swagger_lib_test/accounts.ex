defmodule SwaggerLibTest.Accounts do
  alias SwaggerLibTest.Repo
  alias SwaggerLibTest.Accounts.User

  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def get_user(id) do
    Repo.get(User, id)
  end
end
