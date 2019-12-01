class Comment < ApplicationRecord
  belongs_to :user, inverse_of: :comments
  belongs_to :recipe, inverse_of: :comments
end
