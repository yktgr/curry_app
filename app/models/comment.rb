class Comment < ApplicationRecord
  validates :content, presence: true ,length: { in:1..100 }
  belongs_to :user, inverse_of: :comments
  belongs_to :recipe, inverse_of: :comments
end
