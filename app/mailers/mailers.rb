class Mailers < ActionMailer::Base

  default from: 'pedalassistantmail@gmail.com'

  def confirm_email(user)
    @user = user
    @confirmation_link = user_confirmation_url({token: @user.token})
    mail(to: user.email, subject: 'Confirmação de cadastro - Cerveja Coleções')
  end
end