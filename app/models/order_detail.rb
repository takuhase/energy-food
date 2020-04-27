class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :daily_food
  validates :order_id, presence: true
  validates :daily_food_id, presence: true
  scope :get_order_details, ->(orders) do
    orders.map do |o|
      where(order_id: o.id)
    end
  end
end
