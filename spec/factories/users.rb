FactoryBot.define do
  factory :user do
    name { "Sazae" }
    email { "sazae@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
