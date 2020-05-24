class ShopClerk < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  validates :password, presence: true

  scope :guest_login, -> do
    find_or_create_by!(email: 'guest-shop-clerk@example.com') do |u|
      u.name = 'Guest ShopClerk'
      u.password = SecureRandom.urlsafe_base64
    end
  end
end
