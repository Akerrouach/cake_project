class OrderItem < ActiveRecord::Base
  belongs_to :pastry
  # belongs_to :order
  acts_as_shopping_cart_item_for :order
end
