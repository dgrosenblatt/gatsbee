def log_in(user)
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
  {
    provider: user.provider,
    uid: user.uid,
    info: {
      name: user.name,
      email: user.email
    },
    credentials: {
      token: user.oauth_token,
      expires_at: user.oauth_expires_at
    }
    })
  visit '/'
  click_link "Sign in"
end
