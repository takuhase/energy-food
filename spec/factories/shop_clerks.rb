FactoryBot.define do
  factory :shop_clerk do
    email { "example-shop-clerk-1@energyfood.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
