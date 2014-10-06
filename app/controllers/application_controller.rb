class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  delegate :logged, :logged?, to: :user_session
  helper_method :logged, :logged?

  def user_session
    UserSession.new(session)
  end

  def require_authentication
    unless logged?
      redirect_to root_path, alert: 'Faça login para acessar esta página' and return
    end
  end

  def require_no_authentication
    if logged?
      redirect_to root_path, alert: 'Página incorreta' and return
    end
  end

  def belongs_to(user)
    unless logged == user.id
      redirect_to root_path, alert: 'Esta página não lhe pertence!' and return
    end
  end

  def require_admin
    unless logged? && logged.admin
      redirect_to root_path, alert: 'Você não é administrador!' and return
    end
  end

end
