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
         :recoverable, :rememberable, :trackable, :validatable
end
