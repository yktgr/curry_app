class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
  mount_uploader :picture, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recipe_likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
