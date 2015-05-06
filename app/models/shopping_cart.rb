class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart
  belongs_to :user
  belongs_to :shop

  validates :delivery_date, presence: true, on: [:update]

  def tax_pct
    0
  end
end