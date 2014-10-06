class UsefulController < ApplicationController

  layout 'fullwidth', only: [:index]

  def index
  end

  def user_confirmation
    token = params[:token]
    if User.confirm!(token, session)
      redirect_to root_path, notice: 'Cadastro confirmado com sucesso!'
    else
      redirect_to root_path, notice: 'Token inválido ou cadastro já realizado'
    end
  end
end