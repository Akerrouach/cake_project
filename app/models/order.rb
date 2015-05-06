class Order < ActiveRecord::Base
  belongs_to :user

  acts_as_shopping_cart_using :order_item
end
