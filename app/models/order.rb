class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
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
end
