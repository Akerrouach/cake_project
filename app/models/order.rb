class Order < ActiveRecord::Base
  belongs_to :user
  # has_many :order_items
  acts_as_shopping_cart_using :order_item
end
