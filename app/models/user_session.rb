class UserSession
  include ActiveModel::Model

  attr_accessor :email, :password

  def initialize(session, attributes={})
    @session = session
    @email = attributes[:email]
    @password = attributes[:password]
  end

  def authenticate!
    user = User.find_by(email: @email, password: @password, token: '')
    if user
      store(user)
      true
    else
      false
    end
  end

  def store(user)
    @session[:user_id] = user.id
  end

  def logged?
    @session[:user_id].present?
  end

  def logged
    User.find(@session[:user_id])
  end
end