class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :uid, presence: true, uniqueness: true
  validates :google_token, presence: true, uniqueness: true

  # has_many :gardens

  def self.from_omniauth(access_token)
    user = find_by(uid: access_token.uid)
    return user unless user.nil?

    User.create(email: access_token.info.email,
                uid: access_token.uid)
  end
end
