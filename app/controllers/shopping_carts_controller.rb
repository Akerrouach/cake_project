class ShoppingCartsController < ApplicationController
  def show
    @cart = ShoppingCart.find(params[:id])
    authorize @cart
  end

  def index
    @shopping_carts = policy_scope(ShoppingCart)
  end

  def validate
    @cart = current_user.shopping_carts.last
    @cart.status = true
    authorize @cart

    if @cart.save
      session[:shopping_cart_id] = nil
      redirect_to shop_shopping_carts_path
    else
      render 'shops/show'
    end
  end
end
