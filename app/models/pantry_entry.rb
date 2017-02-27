class PantryEntry < ApplicationRecord
  has_one :ingredient
  has_one :unit
end
