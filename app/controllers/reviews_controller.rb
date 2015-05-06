class ReviewsController < ApplicationController
  def create
    skip_authorization
    @shop = Shop.find(params[:shop_id])
    @review = @shop.reviews.build(reviews_params)
    @review.rating = params[:score].to_f
    shopping_carts = current_user.find_unreviewed_shopping_carts_for_shop(@shop)
    @review.shopping_cart_id = shopping_carts.last.id

    if @review.save
      binding.pry
      shopping_carts.each do |shopping_cart|
        shopping_cart.update_attribute(:review_status, true)
      end
    else
      # Gestion d'erreur
    end
  end

  def reviews_params
    params.require(:review).permit(:content)
  end
end