class Shop < ApplicationRecord
  validates :name, presence: true,length: { maximum:20 }
  validates :address, presence: true,length: { maximum:50 }
  has_many :recipes, dependent: :destroy, inverse_of: :shop
  belongs_to :user
  accepts_nested_attributes_for :recipes, allow_destroy: true
end
