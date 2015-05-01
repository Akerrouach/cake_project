class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart
  belongs_to :user

  def tax_pct
    0
  end
end