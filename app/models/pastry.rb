class Pastry < ActiveRecord::Base

  geocoded_by :pastry_address
  after_validation :geocode, if: ->(pastry){ pastry.pastry_address_changed? }

  belongs_to :shop

  has_attached_file :picture_1,
    styles: { medium: "300x300>", small: "200x200>", thumb: "100x100>" }

  validates_attachment_content_type :picture_1,
    content_type: /\Aimage\/.*\z/

  validates :title, presence: true
  validates :price_per_unit, presence: true
  validates :unit_volume, presence: true
  validates :pastry_address, presence: true


end
