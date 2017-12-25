defmodule EngardeWeb.SessionController do
  use EngardeWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => pass}}) do
    case EngardeWeb.UserAuthController.sign_in_with_email_and_password(
           conn,
           email,
           pass,
           repo: Engarde.Repo
         ) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :index))

      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> EngardeWeb.UserAuthController.sign_out()
    |> redirect(to: session_path(conn, :new))
  end
end
