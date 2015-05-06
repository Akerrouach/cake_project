class Shop < ActiveRecord::Base

  attr_reader :complete_address_shop

  belongs_to :user
  has_many :pastries, dependent: :destroy
  has_many :shopping_carts
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_address, presence: true

   has_attached_file :picture,
   styles: { medium: "300x300>", thumb: "200x200>" }

  validates_attachment_content_type :picture,
   content_type: /\Aimage\/.*\z/

end



