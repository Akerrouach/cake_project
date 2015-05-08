class ShoppingCartsController < ApplicationController

  before_action :find_cart, only: [:validate, :accept, :decline]

  def orders_sent
    skip_authorization
    @shopping_carts = current_user.shopping_carts.order("id DESC").select { |cart| cart.sent }
  end

  def orders_received
    skip_authorization
    @shop_id = []
    current_user.shops.each do |shop|
      @shop_id << shop.id
    end
    @shopping_carts = ShoppingCart.where(shop_id: @shop_id).order("id DESC").select { |cart| cart.sent }
  end

  def validate
    if @cart.shopping_cart_items.empty?
      flash[:alert] = "Vous n'avez ajouté aucun produit dans votre panier"
      @shop = @cart.shop
      skip_authorization
      render 'shops/show'
    else
      @cart.total_price = @cart.total
      @cart.delivery_date = params[:delivery_date]
      @cart.sent = true
      @cart.accepted = "en attente"
      authorize @cart
      if @cart.save
        raise ""
        session[:shopping_cart_id] = nil
        @cart.send_order_email
        redirect_to orders_sent_shopping_carts_path
      else
        @shop = @cart.shop
        skip_authorization
        render 'shops/show'
      end
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
    params.require(:shopping_cart).permit(:delivery_date)
  end


end

