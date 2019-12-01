class Recipe < ApplicationRecord
  enum curry_type: {chicken: 0, beef: 1, pork: 2, fish: 3, vege: 4, other: 5}
  belongs_to :user, optional: true, inverse_of: :recipes
  belongs_to :shop, optional: true, inverse_of: :recipes
  has_many :recipe_likes, dependent: :destroy
  has_many :likes_users, through: :recipe_likes, source: :user
  has_many :comments, dependent: :destroy, inverse_of: :recipe
  has_many :materials, dependent: :destroy, inverse_of: :recipe
  accepts_nested_attributes_for :materials, allow_destroy: true
  has_many :flows, dependent: :destroy, inverse_of: :recipe
  accepts_nested_attributes_for :flows, allow_destroy: true
  mount_uploader :picture, ImageUploader
end
