class Pastry < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode, if: ->(pastry){ pastry.pastry_address_changed? || pastry.pastry_zip_code_changed? || pastry.pastry_city_changed? }

  belongs_to :shop
  # has_many :pastry_pictures

  has_attached_file :picture_1,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture_1,
    content_type: /\Aimage\/.*\z/

  validates :title, presence: true
  validates :price_per_unit, presence: true

  def address
    "#{pastry_address}, #{pastry_zip_code}, #{pastry_city}"
  end

end
