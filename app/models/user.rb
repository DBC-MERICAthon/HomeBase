class User < ActiveRecord::Base
  has_many :lightbulbs

  def self.from_omniauth(auth)
    where({uid: auth.uid}).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.name = auth.info.name
      user.first_name = auth.info.name.split(' ')[0]
      user.image_url = auth.info.image
      user.last_name = auth.info.name.split(' ')[1]
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
