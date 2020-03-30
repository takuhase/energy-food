class FoodCategory < ApplicationRecord
  belongs_to :nutrient
  validates :name, presence: true
end
