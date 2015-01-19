OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'],
  { access_type: 'offline',
    scope: 'userinfo.email, calendar',
    prompt: 'select_account' }
end
