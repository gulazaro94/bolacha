class UserSessionsController < ApplicationController

  def new
    require_no_authentication
    @session = UserSession.new(session)
  end

  def create
    require_no_authentication

    user_session_params = params.require(:user_session).permit(:email, :password)
    @session = UserSession.new(session, user_session_params)
    val = @session.authenticate!
    if val == nil
      redirect_to root_path, alert: 'Confirme seu email'
    elsif val
      redirect_to logged, notice: 'Logado'
    else
      flash[:alert] = 'Email e/ou senha incorreto(s)'
      render :new
    end
  end

  def destroy
    user_session = UserSession.new(session)
    user_session.destroy
    redirect_to root_path
  end
end