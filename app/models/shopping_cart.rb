class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart
  belongs_to :user
  belongs_to :shop

  validates :delivery_date, presence: true, on: [:update]


  def tax_pct
    0
  end

  def send_order_email
    UserMailer.order(self.user, self).deliver
    UserMailer.order_for_baker(self.shop.user, self).deliver
  end

  def send_accepted_order_email
    UserMailer.order_accepted(self.user, self).deliver
  end

   def send_refused_order_email
    UserMailer.order_refused(self.user, self).deliver
    end

end