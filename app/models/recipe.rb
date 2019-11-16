class Recipe < ApplicationRecord
  enum curry_type: {chicken: 0, beef: 1,pork: 2,vege: 3, other: 4}
end
