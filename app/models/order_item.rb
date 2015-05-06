class OrderItem < ActiveRecord::Base
  belongs_to :pastry

  acts_as_shopping_cart_item_for :order
end
