class UserSessionsController < ApplicationController

  def new
    require_no_authentication
    @session = UserSession.new(session)
  end

  def create
    require_no_authentication

    user_session_params = params.require(:user_session).permit(:email, :password)
    @session = UserSession.new(session, user_session_params)
    if @session.authenticate!
      redirect_to logged
    else
      redirect_to root_path
    end
  end

  def destroy

  end
end