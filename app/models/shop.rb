class Shop < ActiveRecord::Base

  belongs_to :user, dependent: :destroy
  has_many :pastries

  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_city, presence: true

   has_attached_file :picture,
   styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
   content_type: /\Aimage\/.*\z/



end



