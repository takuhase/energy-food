class Like < ApplicationRecord
  belongs_to :user
  belongs_to :food
  counter_culture :food
  validates :user_id, presence: true
  validates :food_id, presence: true
end
