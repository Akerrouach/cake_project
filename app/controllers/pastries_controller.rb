class PastriesController < ApplicationController
  def index
  end

  def new
    @shop = current_user.shops.find(params[:shop_id])
    @pastry = @shop.patries.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
