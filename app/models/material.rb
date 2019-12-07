class Material < ApplicationRecord
  validates :name, presence: true ,length: { in:1..20 }
  validates :amount, presence: true ,length: { in:1..10 }
  validates :curry_type, presence: true ,length: { in:1..10 }
  belongs_to :recipe, optional: true, inverse_of: :materials
end
