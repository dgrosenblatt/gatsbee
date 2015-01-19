class User < ActiveRecord::Base
  has_many :memberships
  has_many :clubs, through: :memberships
  has_many :organized_clubs, class_name: "Club", foreign_key: "organizer_id"
  has_many :comments
  has_many :meetings

  def refresh
    uri = URI.parse("https://www.googleapis.com/oauth2/v3/token")
    response = Net::HTTP.post_form(uri,
      { "client_id" => ENV['CLIENT_ID'],
        "client_secret" => ENV['CLIENT_SECRET'],
        "refresh_token" => self.refresh_token,
        "grant_type" => "refresh_token"
        }
      )
    self.update_attributes(
      oauth_token: JSON.parse(response.body)["access_token"],
      oauth_expires_at: DateTime.now.advance(:seconds, JSON.parse(response.body)["expires_in"])
      )
  end

  def self.from_omniauth(auth)
    User.where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
