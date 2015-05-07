class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @shops = policy_scope(Shop)
  end

  def new
    @shop = current_user.shops.new
    authorize @shop
  end

  def create
    @shop = current_user.shops.new(shop_params)
    authorize @shop
    if @shop.save
      flash[:notice] = "La boutique #{@shop.name} a bien été créee!"
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def show
    if current_user != nil
      @orders = current_user.find_unreviewed_shopping_carts_for_shop(@shop).order("delivery_date DESC")
      @can_post_review = @orders.any?
      @shopping_cart = @orders.first
      authorize @shop
    else
      authorize @shop
    end
  end

  def edit
  end

  def update
    authorize @shop
    @shop.update(shop_params)
    @shop.pastries.each do |pastry|
      pastry.pastry_address = @shop.preparation_address
      pastry.save
    end
    redirect_to shop_path(@shop)
  end

  def destroy
    authorize @shop
    @shop.destroy
    redirect_to shops_path
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
    authorize @shop
  end

  def shop_params
    params.require(:shop).permit(:name, :description, :preparation_address, :picture, :delivery_date)
  end

end
