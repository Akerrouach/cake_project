class PastriesController < ApplicationController

  before_action :find_pastry, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @pastries = policy_scope(Pastry)
    @location = nil
    if params[:location] != "" && params[:location] != nil
      @location = params[:location]
      @shops = []
      Shop.all.each do |shop|
        @shops << shop if shop.preparation_address.match(/#{params[:location]}/i).to_s.downcase == params[:location].downcase
      end
    elsif params[:location] == ""
      @shops = Shop.all
    elsif params[:location] == nil
      @shops = Shop.all
    end
    @pastries = []
    @shops.each do |shop|
      shop.pastries.each do |pastry|
        if (pastry.title).match(/#{params[:item]}/i).to_s.downcase == params[:item].downcase
          @pastries << pastry
        end
      end
    end
    @markers = Gmaps4rails.build_markers(@pastries) do |pastry, marker|
      marker.lat pastry.latitude
      marker.lng pastry.longitude
      marker.infowindow render_to_string(partial: "map_box", locals: { pastry: pastry })
  end
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @pastry = @shop.pastries.new
    authorize @pastry
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @pastry = @shop.pastries.new(pastry_params)
    @pastry.pastry_address = @shop.preparation_address
    authorize @pastry
    if @pastry.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def edit
    @shop = current_user.shops.find(params[:shop_id])
    authorize @pastry
  end

  def update
    authorize @pastry
    @shop = @pastry.shop
    @pastry.update(pastry_params)
    redirect_to pastry_path(@pastry)
  end

  def show
    authorize @pastry
  end

  def destroy
    authorize @pastry
    @shop = @pastry.shop
    @pastry.destroy
    redirect_to shop_path(@shop)
  end

  private

  def find_pastry
    @pastry = Pastry.find(params[:id])
  end

  def pastry_params
    params.require(:pastry).permit(:title, :description, :price_per_unit, :picture_1, :unit_volume, :pastry_address, :state)
  end
end