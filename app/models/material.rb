class Material < ApplicationRecord
  belongs_to :recipe, optional: true, inverse_of: :materials
end
