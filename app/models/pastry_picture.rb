class PastryPicture < ActiveRecord::Base
  # belongs_to :pastry

  has_attached_file :picture,
   styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
   content_type: /\Aimage\/.*\z/

  validates :picture, presence: true
end
