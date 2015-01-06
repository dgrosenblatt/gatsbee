class User < ActiveRecord::Base
  has_and_belongs_to_many :clubs, join_table: "memberships" 
  has_many :organized_clubs, class_name: "Club", foreign_key: "organizer_id"

  def self.from_omniauth(auth)
    User.where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end