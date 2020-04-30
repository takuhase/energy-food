class DailyFood < ApplicationRecord
  has_many :order_details
  belongs_to :food
  validates :food_id, presence: true
  validates :food, uniqueness: { scope: :date }
  validates :date, presence: true
  delegate :chinese_name, :english_name, :alacarte_price, :to => :food

  scope :show_menu_list, ->(date = Date.tomorrow) do
    where(date: date)
  end

  scope :get_daily_foods, ->(order_detail_list) do
    order_detail_list.map do |order_details|
      order_details.map do |detail|
        find(detail.daily_food_id)
      end
    end
  end
end
