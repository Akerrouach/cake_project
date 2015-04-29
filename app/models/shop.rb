class Shop < ActiveRecord::Base


  belongs_to :user, dependent: :destroy
  has_many :pastries

  geocoded_by :address
  after_validation :geocode, if: ->(shop){ shop.preparation_address_changed? || shop.preparation_zip_code_changed? || shop.preparation_city_changed? }


  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_city, presence: true

   has_attached_file :picture,
   styles: { medium: "300x300>", thumb: "200x200>" }

  validates_attachment_content_type :picture,
   content_type: /\Aimage\/.*\z/



end



