defmodule SwaggerLibTestWeb.UserController do
  use SwaggerLibTestWeb, :controller

  alias SwaggerLibTest.Accounts

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> json(%{id: user.id, name: user.name, email: user.email})

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: changeset.errors})
    end
  end

  def show(conn, %{"id" => id}) do
    case Accounts.get_user(id) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> json(%{id: user.id, name: user.name, email: user.email})

      {:error, :not_found} ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "User not found"})
    end
  end
end
