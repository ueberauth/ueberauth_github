defmodule Skull do
  use Ueberauth.Strategy, uid_field: :login,
                          default_scope: "user,public_repo",
                          oauth2_module: Ueberauth.Strategy.Github.OAuth
end

defmodule Ueberauth.Strategy.GithubTest do
  use ExUnit.Case
  alias Ueberauth.Strategy.Github

  test "handle_request" do
    import Plug.Conn, only: [put_private: 3]

    Application.put_env(:ueberauth, Ueberauth.Strategy.Github.OAuth, [])

    conn =
      %Plug.Conn{params: %{"scope" => "user,public_repo,gist"}}
      |> Plug.Adapters.Test.Conn.conn("GET", "http://foo.xyz/", %{})
      |> put_private(:ueberauth_request_options, [options: [:oauth2_module, Ueberauth.Strategy.Github.OAuth]])

    conn =
      conn
      |> Ueberauth.Strategy.Github.handle_request!
      |> IO.inspect

    assert conn.halted
  end
end
