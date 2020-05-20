class Food < ApplicationRecord
  has_many :daily_foods
  has_many :likes, dependent: :destroy
  has_many :fav_users, through: :likes, source: :user
  belongs_to :food_category
  validates :chinese_name, presence: true
  validates :english_name, presence: true
  validates :food_category_id, presence: true
  delegate :alacarte_price, :to => :food_category

  scope :descending_order, -> do
    all.includes(food_category: :nutrient).order(created_at: "DESC")
  end

  def fav(user)
    likes.create(user_id: user.id)
  end

  def unfav(user)
    likes.find_by(user_id: user.id).destroy
  end

  def fav?(user)
    fav_users.include?(user)
  end
end
