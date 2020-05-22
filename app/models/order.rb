class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :daily_foods, through: :order_details
  belongs_to :user
  PER = 5
  scope :get_orders, ->(u_id, pg) do
    where(user_id: u_id).paginate(page: pg, per_page: PER).includes(
      order_details: {
        daily_food: {
          food: {
            food_category: :nutrient,
          },
        },
      }
    ).order(id: "DESC")
  end

  scope :get_daily_foods, ->(order_id) do
    find(order_id).daily_foods
  end
end
