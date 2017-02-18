defmodule Ueberauth.Strategy.Github.OAuthTest do
  use ExUnit.Case

  alias Ueberauth.Strategy.Github.OAuth, as: GithubOAuth

  test "client" do
    client = GithubOAuth.client
    expected =
      %OAuth2.Client{authorize_url: "/oauth/authorize",
                     client_id: "",
                     client_secret: "",
                     headers: [],
                     params: %{},
                     redirect_uri: "",
                     site: "",
                     strategy: OAuth2.Strategy.AuthCode,
                     token: nil,
                     token_method: :post,
                     token_url: "/oauth/token"}

    assert client == expected
  end

  test "get" do
    {:ok, response} = GithubOAuth.get(%TestOAuthToken{}, "http://foo.xyz", [], [])
    expected =
      %OAuth2.Response{body: %{emails: "foo@bar.com"},
                       headers: [],
                       status_code: 200}

    assert response == expected
  end
end
