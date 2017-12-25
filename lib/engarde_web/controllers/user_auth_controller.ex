defmodule EngardeWeb.UserAuthController do
  import Plug.Conn

  alias Engarde.Accounts.User

  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, repo) do
    user_id = get_session(conn, :user_id)
    user = user_id && repo.get(User, user_id)
    assign(conn, :current_user, user)
  end

  def sign_in(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def sign_in_with_email_and_password(conn, email, given_pass, opts) do
    repo = Keyword.fetch!(opts, :repo)
    user = repo.get_by(User, email: email)

    cond do
      user && Comeonin.Bcrypt.checkpw(given_pass, user.password_hash) ->
        {:ok, sign_in(conn, user)}

      user ->
        {:error, :unauthorized, conn}

      true ->
        Comeonin.Bcrypt.dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

  def sign_out(conn) do
    configure_session(conn, drop: true)
  end
end
