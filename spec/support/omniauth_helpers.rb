def set_omniauth
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
  {
    provider: "google_oauth2",
    uid: 12344321,
    info: {
      name: "Paul Pierce",
      email: "P2@celtix.net"
     },
    credentials: {
      token: "934fAgutenberg23fn23o",
      expires_at: Time.new(2018, 03, 21, 12, 0, 0, "+09:00")
    }
  })
end
