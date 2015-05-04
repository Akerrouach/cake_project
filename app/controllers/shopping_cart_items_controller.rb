class ShoppingCartItemsController < ApplicationController
  before_action :find_pastry, :find_cart
  skip_before_action :authenticate_user!, only: [:create, :destroy]

  def create
    authorize @cart
    @cart.add(@pastry, @pastry.price_per_unit)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    authorize @cart
    @cart.remove(@pastry, 1)
    respond_to do |format|
      format.js
    end
  end

  private

  def find_pastry
    @pastry = Pastry.find(params[:id])
  end

  def find_cart
    if session[:shopping_cart_id]
      if current_user == nil
        if ShoppingCart.where(["shop_id = ? and user_id IS NULL", @pastry.shop]).empty?
          @cart = ShoppingCart.new
          @cart.shop = @pastry.shop
          @cart.save
        else
          @cart = ShoppingCart.where(["shop_id = ? and user_id IS NULL", @pastry.shop])[0]
        end
      else
        if ShoppingCart.where(["user_id = ? and shop_id = ?", current_user, @pastry.shop]).empty?
          @cart = ShoppingCart.new
          @cart.user = current_user
          @cart.shop = @pastry.shop
          @cart.save
        else
          @cart = ShoppingCart.where(["user_id = ? and shop_id = ?", current_user, @pastry.shop])[0]
        end
      end
    else
      if current_user == nil
        @cart = ShoppingCart.new
        @cart.shop = @pastry.shop
        @cart.save
        session[:shopping_cart_id] = @cart.id
      else
        @cart = ShoppingCart.new
        @cart.user = current_user
        @cart.shop = @pastry.shop
        @cart.save
        session[:shopping_cart_id] = @cart.id
      end
    end
  end
end




