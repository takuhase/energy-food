class Nutrient < ApplicationRecord
  validates :name, presence: true
  validates :addon_price, presence: true
  validates :alacarte_price, presence: true
end
