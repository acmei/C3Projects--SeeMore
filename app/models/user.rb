class User < ActiveRecord::Base

  # Validations ----------------------------------------------
  validates :username, :uid, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    uid = auth_hash[:uid]
    provider = auth_hash[:provider]

    user = User.where(uid: uid, provider: provider).first_or_initialize
    user.email = auth_hash[:info][:email]
    user.username = auth_hash[:info][:name]

    return user.save ? user : nil # don't love this nil. would be useful to see the errors. what to do if someone authenticates at github but I couldn't create a valid record?
  end
end