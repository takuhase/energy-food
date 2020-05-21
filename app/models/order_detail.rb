class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :daily_food
  validates :order_id, presence: true
  validates :daily_food_id, presence: true

  scope :specific_date, ->(daily_food) do
    where(daily_food_id: daily_food.id)
  end
end
