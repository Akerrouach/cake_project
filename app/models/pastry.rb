class Pastry < ActiveRecord::Base
  belongs_to :shop, dependent: :destroy
  has_many :pastry_pictures

  validates :title, presence: true
  validates :price_per_unit, presence: true
  validates :unit_volume, presence: true
  validates :preparation_address, presence: true
end
