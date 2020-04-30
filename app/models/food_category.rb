class FoodCategory < ApplicationRecord
  has_many :foods
  belongs_to :nutrient
  validates :name, presence: true
  delegate :alacarte_price, :to => :nutrient
end
