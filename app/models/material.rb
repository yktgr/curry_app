class Material < ApplicationRecord
  belongs_to :recipe, optional: true
end
