class User < ActiveRecord::Base
  has_many :collections
  has_many :items, through: :collections

  mount_uploader :picture, PictureUploader

  validates_presence_of :name, :email, :birth_date
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_confirmation_of :password
  validates_length_of :password, minimum: 6

  before_create do |user|
    user.admin = false
    user.token = SecureRandom.urlsafe_base64
  end

  def self.confirm!(token, session)
    user = User.find_by(token: token)
    if user
      user.token = ''
      user.save!
      user_session = UserSession.new session
      user_session.store user
    else
      false
    end
  end

end
