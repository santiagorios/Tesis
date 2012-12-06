# encoding: utf-8
class UserMailer < ActionMailer::Base
  default from: "info@santiago-rios.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url  = "http://tesis.santiago-rios.com/users/#{user.activation_token}/activate"
    mail(:to => user.email,
         :subject => "Bienvenido al Sistema de Difusión de la Gestión del Conocimiento de la ESPE")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    @url  = "http://tesis.santiago-rios.com/login"
    mail(:to => user.email,
         :subject => "Su cuenta ha sido activada")
  end

  def reset_password_email(user)
    @user = user
    @url  = "http://tesis.santiago-rios.com/password_resets/#{user.reset_password_token}/edit"
    mail(:to => user.email,
         :subject => "Su clave ha sido reseteada")
  end

end
