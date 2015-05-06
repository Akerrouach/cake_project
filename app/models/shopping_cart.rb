class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart
  belongs_to :user
  belongs_to :shop
  has_one :review

  def tax_pct
    0
  end

  def delivery_status
    if @delivery_date != nil
      if Date.today() == @delivery_date + 1
        @delivery_status = true
      else
        @delivery_status = false
      end
    end
  end


end

