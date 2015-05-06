class UserMailer < ApplicationMailer
  default from: 'hello@deliceavenue.com'

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail to: user.email, subject: 'Bienvenue à DeliceAvenue'
    # This will render a view in `app/views/user_mailer`!
  end

  def order(user, order)
    @user = user
    @order = order
    mail to: user.email, subject: 'Confirmation de votre commande'
  end

  # def response(user)
  #   @user = user
  #   mail to: user.email, subject: 'Réponse commande'
  # end

end