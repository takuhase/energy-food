class Order < ApplicationRecord
  belongs_to :user
  validates :delivery_date, presence: true
end
