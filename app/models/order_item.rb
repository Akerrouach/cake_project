class OrderItem < ActiveRecord::Base
  belongs_to :pastry
  belongs_to :order
end
