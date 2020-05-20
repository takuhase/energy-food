class DailyFood < ApplicationRecord
  has_many :order_details
  belongs_to :food
  validates :food_id, presence: true
  validates :food, uniqueness: { scope: :date }
  validates :date, presence: true
  delegate :chinese_name, :english_name, :alacarte_price, :likes_count, :to => :food

  scope :show_menu_list, ->(date) do
    where(date: date)
  end

  scope :descending_order, -> do
    all.includes(food: [food_category: :nutrient]).order(date: "DESC")
  end
end
