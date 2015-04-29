class Pastry < ActiveRecord::Base
  belongs_to :shop, dependent: :destroy
  # has_many :pastry_pictures

  has_attached_file :picture_1,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture_1,
    content_type: /\Aimage\/.*\z/

  validates :title, presence: true
  validates :price_per_unit, presence: true
  validates :unit_volume, presence: true
  validates :preparation_address, presence: true
end
