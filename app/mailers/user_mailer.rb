class UserMailer < ApplicationMailer
  # notificar creacion de cuenta

  def bienvenida_mailer(user)
    @user = User.last
    mail(to: @user.email, subject: 'Welcome to Seguimiento 2020/Bienvenido a Seguimiento 2020')
  end

  # notificar anotacion

  def anotacion_mailer(user, anotacion)
    @user = user
    @anotacion = anotacion
    mail(to: @user.email, subject: 'Nueva anotacion')
  end

  # notificar comentario

  def comentario_mailer(user, anotacion, comentario)
    @user = user # a quien se le envia el email
    @anotacion = anotacion
    @comentario = comentario
    mail(to: @user.email, subject: 'Nuevo comentario')
  end

end
