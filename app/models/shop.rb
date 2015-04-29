class Shop < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode, if: ->(shop){ shop.preparation_address_changed? || shop.preparation_zip_code_changed? || shop.preparation_city_changed? }

  belongs_to :user, dependent: :destroy
  has_many :pastries

  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_city, presence: true

   has_attached_file :picture,
   styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
   content_type: /\Aimage\/.*\z/


def address
    "#{preparation_address}, #{preparation_zip_code}, #{preparation_city}"
  end

end



