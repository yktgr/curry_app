class Recipe < ApplicationRecord
  enum curry_type: {chicken: 0, beef: 1,pork: 2,vege: 3, other: 4}
  has_many :recipe_likes, dependent: :destroy
  has_many :likes_users, through: :recipe_likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :materials, dependent: :destroy
  accepts_nested_attributes_for :materials, allow_destroy: true
  has_many :flows, dependent: :destroy
  accepts_nested_attributes_for :flows, allow_destroy: true
  mount_uploader :picture, ImageUploader
  belongs_to :user, optional: true

end
