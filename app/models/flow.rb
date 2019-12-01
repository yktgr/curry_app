class Flow < ApplicationRecord
  belongs_to :recipe, optional: true, inverse_of: :flows
  mount_uploader :picture, ImageUploader
end
