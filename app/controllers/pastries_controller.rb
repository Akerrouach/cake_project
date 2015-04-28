class PastriesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show]

  def index
  end

  def new
    @shop = current_user.shops.find(params[:shop_id])
    @pastry = @shop.pastries.new
  end

  def create
    @shop = current_user.shops.find(params[:shop_id])
    @pastry = @shop.pastries.new(pastry_params)
     if @pastry.save
       redirect_to user_pastrys_path(@pastry)
     else
       render :new
     end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  def result

  end

  private

  def find_pastry
    @pastry = Pastry.find(params[:id])
  end

  def pastry_params
    params.require(:pastry).permit(:description, :price_per_unit, :state, :unit_volume, :preparation_address)
  end
end