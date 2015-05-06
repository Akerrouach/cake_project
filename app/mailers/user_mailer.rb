class UserMailer < ApplicationMailer
  default from: 'hello@deliceavenue.com'

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail to: user.email, subject: 'Bienvenue à DeliceAvenue'
    # This will render a view in `app/views/user_mailer`!
  end

  def order(user, shopping_cart)
    @user = user
    @shoppingcart = shopping_cart
    mail to: user.email, subject: 'Confirmation de votre commande'
  end

  def order_accepted(user, shopping_cart)
    @user = user
    @shoppingcart = shopping_cart
    mail to: user.email, subject: 'Commande acceptée'
  end

  def order_refused(user, shopping_cart)
    @user = user
    @shoppingcart = shopping_cart
    mail to: user.email, subject: 'Commande annulée'
  end

  def order_for_baker(user, shopping_cart)
    @user = user
    @shoppingcart = shopping_cart
    mail to: user.email, subject: 'Nouvelle commande'
  end

  # def response(user)
  #   @user = user
  #   mail to: user.email, subject: 'Réponse commande'
  # end

end