class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :daily_food
  validates :order_id, presence: true
  validates :daily_food_id, presence: true
end
