class ShoppingCartItemsController < ApplicationController
  before_action :find_pastry

  def create
    @cart.user = current_user
    authorize @cart
    @cart.save
    @cart.add(@pastry, @pastry.price_per_unit, 1)
    # @cart.add(@pastry, @pastry.price_per_unit, params[:shopping_cart_item][:quantity].to_i)
    session[:shopping_cart_id] = @cart.id
    redirect_to shop_path(@pastry.shop)
  end

  def destroy

  end

  private

  def find_pastry
    @pastry = Pastry.find(params[:id])
  end

end
