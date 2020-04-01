class Nutrient < ApplicationRecord
  has_many :food_categories
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :addon_price, presence: true
  validates :alacarte_price, presence: true
end
