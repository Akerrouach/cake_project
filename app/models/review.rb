class Review < ActiveRecord::Base
  belongs_to :shop
  belongs_to :shopping_cart

  def user
    self.shopping_cart.user
  end
end
