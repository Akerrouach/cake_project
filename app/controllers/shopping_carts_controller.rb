class ShoppingCartsController < ApplicationController

  before_action :find_cart, only: [:accept, :decline]

  def orders_sent
    skip_authorization
    @shopping_carts = []
    ShoppingCart.all.each do |cart|
      if cart.user_id == current_user.id
        @shopping_carts << cart if cart.sent
      end
    end
    @shopping_carts = @shopping_carts.sort { |a, b| a[1] <=> b[1] }
  end

  def orders_received
    skip_authorization
    @shopping_carts = []
    ShoppingCart.all.each do |cart|
      if (Shop.find(cart.shop_id)).user_id == current_user.id
        @shopping_carts << cart if cart.sent
      end
    end
    @shopping_carts = @shopping_carts.sort { |a, b| a[1] <=> b[1] }
  end

  def validate
    @cart = current_user.shopping_carts.last
    @cart.delivery_choice = params[:delivery_choice]
    @cart.sent = true
    @cart.accepted = "en attente"
    authorize @cart
    if @cart.save
      session[:shopping_cart_id] = nil
      redirect_to orders_sent_shopping_carts_path
    else
      render 'shops/show'
    end
  end

  # def update
  #   find_cart
  #   authorize @cart
  #   if @cart.update(shopping_cart_params)
  #     respond_to do |format|
  #       format.js
  #     end
  #   else
  #     flash[:alert] = "ERREUR"
  #   end
  # end

  def accept
    skip_authorization
    @cart.accepted = "acceptée"
    @cart.save
    redirect_to orders_received_shopping_carts_path
  end

  def decline
    skip_authorization
    @cart.accepted = "refusée"
    @cart.save
    redirect_to orders_received_shopping_carts_path
  end

private

  def find_cart
    @cart = ShoppingCart.find(params[:id])
  end

  def shopping_cart_params
    params.require(:shopping_cart).permit(:delivery_choice)
  end

end

