class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :user
  scope :get_orders, ->(u_id) do
    where(user_id: u_id).includes(
      order_details: {
        daily_food: {
          food: {
            food_category: :nutrient,
          },
        },
      }
    ).order(id: "DESC")
  end
end
