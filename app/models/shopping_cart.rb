class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart
  belongs_to :user
  belongs_to :shop


  after_validate :send_order_email

  validates :delivery_date, presence: true, on: [:update]


  def tax_pct
    0
  end


  private

  def send_order_email
    UserMailer.order(self.user, self).deliver
  end

end