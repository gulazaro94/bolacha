class UsefulController < ApplicationController

  def index
  end

  def user_confirmation
    token = params[:token]
    if User.confirm!(token, session)
      redirect_to root_path, notice: 'Cadastro confirmado com sucesso!'
    else
      redirect_to root_path, alert: 'Token inválido!'
    end
  end
end