class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  has_many :shops, dependent: :destroy
  has_many :shopping_carts

  after_create :send_welcome_email
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true
  # validates :city, presence: true
  # validates :zip_code, presence: true
  # validates :phone_number, presence: true


  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [ :facebook ]

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def find_unreviewed_shopping_carts_for_shop(shop)
    ShoppingCart.where(shop_id: shop.id, user_id: self.id, delivery_status: nil, review_status: false)
  end

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.name.split[0]
      user.last_name = auth.info.name.split[1]
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end


  private

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end

end