class Shop < ActiveRecord::Base
  belongs_to :user, dependent: :destroy,

  has_many :pastries

  validates :name, presence: true

end
