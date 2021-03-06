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
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'Faça login para acessar esta página' and return }
        format.js { render json: 'login-required' }
      end
    end
  end

  def require_no_authentication
    if logged?
      redirect_to root_path, alert: 'Redirecionado, não pode estar logado!' and return
    end
  end

  def belongs_to(user)
    unless logged? && logged.id == user.id
      redirect_to root_path, alert: 'Esta página não lhe pertence!' and return
    end
  end

  def require_admin
    unless logged? && logged.admin
      redirect_to root_path, alert: 'Você não é administrador!' and return
    end
  end

end
