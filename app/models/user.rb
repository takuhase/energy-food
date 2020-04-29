class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }

  scope :get_all_orders, ->(user_id) do
    find(user_id).orders.order(id: "DESC")
  end

  scope :guest_login, -> do
    find_or_create_by!(email: 'guest@example.com') do |u|
      u.name = 'Guest User'
      u.password = SecureRandom.urlsafe_base64
    end
  end
end
