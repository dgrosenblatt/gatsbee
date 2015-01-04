def set_omniauth
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
  {
    provider: 'google_oauth2',
    uid: '123545',
    info: {
      name: "Tom Brady",
      email: "TB12@pats.biz"
     },
    credentials: {
      token: "abc123",
      expires_at: Time.new(2016, 02, 24, 12, 0, 0, "+09:00")
    }
  })
end
