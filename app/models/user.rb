class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  has_many :shops

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
  validates :phone_number, presence: true


  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [ :facebook ]

  def self.find_for_facebook_oauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]  # Fake password for validation
        user.name = auth.info.name
        user.picture = auth.info.image
        user.token = auth.credentials.token
        user.token_expiry = Time.at(auth.credentials.expires_at)
      end
  end

end
