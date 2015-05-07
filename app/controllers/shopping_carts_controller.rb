class ShoppingCartsController < ApplicationController

  before_action :find_cart, only: [:validate, :accept, :decline]

  def orders_sent
    skip_authorization
    @shopping_carts = current_user.shopping_carts.select { |cart| cart.sent }
    @shopping_carts = @shopping_carts.sort {|a,b| a[7] <=> b[7]}
  end

  def orders_received
    skip_authorization
    @shopping_carts = []
    ShoppingCart.all.each do |cart|
      if (Shop.find(cart.shop_id)).user_id == current_user.id
        @shopping_carts << cart if cart.sent
      end
    end
    @shopping_carts = @shopping_carts.sort {|a,b| a[7] <=> b[7]}
  end

  def validate
    @cart.delivery_choice = params[:delivery_choice]
    @cart.delivery_date = params[:delivery_date]
    p @cart, params[:delivery_date]
    @cart.sent = true
    @cart.accepted = "en attente"
    authorize @cart
    if @cart.save
      session[:shopping_cart_id] = nil
      @cart.send_order_email
      redirect_to orders_sent_shopping_carts_path
    else
      @shop = @cart.shop
      render 'shops/show'
    end
  end

  def accept
    skip_authorization
    @cart.accepted = "acceptée"
    if @cart.save
      @cart.send_accepted_order_email
      redirect_to orders_received_shopping_carts_path
    else
      flash[:alert] = "Erreur"
      redirect_to :back
    end
  end

  def decline
    skip_authorization
    @cart.accepted = "refusée"
    if @cart.save
      @cart.send_refused_order_email
      redirect_to orders_received_shopping_carts_path
    else
      flash[:alert] = "Erreur"
      redirect_to :back
    end
  end

private

  def find_cart
    @cart = ShoppingCart.find(params[:id])
  end

  def shopping_cart_params
    params.require(:shopping_cart).permit(:delivery_choice, :delivery_date)
  end


end

