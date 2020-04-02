class DailyFood < ApplicationRecord
  has_many :order_details
  belongs_to :food
  validates :food_id, presence: true
  validates :food, uniqueness: { scope: :date }
  validates :date, presence: true
end
