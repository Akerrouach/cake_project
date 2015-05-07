class Review < ActiveRecord::Base
  belongs_to :shop
  belongs_to :shopping_cart

  def user
    User.find(ShoppingCart.find(self.shopping_cart_id).user_id)
  end
end
