class Shop < ApplicationRecord
  # validates :name,:mail,:picture
  has_many :recipes, inverse_of: :shop
  accepts_nested_attributes_for :recipes, allow_destroy: true
end
