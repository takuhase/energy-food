class Food < ApplicationRecord
  belongs_to :food_category
  validates :chinese_name, presence: true
  validates :english_name, presence: true
end
