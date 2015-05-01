class ShoppingCartItemsController < ApplicationController
  before_action :find_pastry

  def create
    @cart.user = current_user
    authorize @cart
    @cart.save
    @cart.add(@pastry, @pastry.price_per_unit, 1)
    session[:shopping_cart_id] = @cart.id
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @cart.user = current_user
    authorize @cart
    @cart.save
    @cart.remove(@pastry, 1)
    session[:shopping_cart_id] = @cart.id
      respond_to do |format|
      format.js
    end
  end

  private

  def find_pastry
    @pastry = Pastry.find(params[:id])
  end

end

