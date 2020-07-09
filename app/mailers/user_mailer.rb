class UserMailer < ApplicationMailer
  # notificar creacion de cuenta

  def bienvenida_mailer(user)
    @user = User.last
    mail(to: @user.email, subject: 'Welcome to Seguimiento 2020/Bienvenido a Seguimiento 2020')
  end

  # notificar anotacion

  def anotacion_mailer; end

  # notificar comentario

  def comentario_mailer; end

end
