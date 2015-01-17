def sign_in
  set_omniauth
  visit "/"
  click_link "Sign in"
end

def organize_club
  club = FactoryGirl.build(:club)
  click_link "Clubs"
  click_link "Create New Book Club"
  fill_in "Name", with: club.name
  fill_in "Description", with: club.description
  select "Public", from: "Visibility"
  click_button "Create Club"
end

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
      oauth_token: user.oauth_token,
      oauth_expires_at: user.oauth_expires_at
    }
    })
  visit '/'
  click_link "Sign in"
end
