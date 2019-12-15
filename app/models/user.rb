class User < ApplicationRecord
  # Include default devise modules. Others available are:,
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true ,length: { in:1..255 }
  validates :email, presence: true ,length: { in:1..255 }
  validates :picture, length: { maximum:255 }
  has_many :recipes, dependent: :destroy, inverse_of: :user
  mount_uploader :picture, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recipe_likes, dependent: :destroy, inverse_of: :user
  has_many :comments, dependent: :destroy, inverse_of: :user
end
