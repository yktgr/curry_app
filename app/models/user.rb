class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
  mount_uploader :picture, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
