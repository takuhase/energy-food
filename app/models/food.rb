class Food < ApplicationRecord
  has_many :daily_foods
  belongs_to :food_category
  validates :chinese_name, presence: true
  validates :english_name, presence: true
  validates :food_category_id, presence: true
end
