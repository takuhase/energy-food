FactoryBot.define do
  factory :order do
    delivery_date { "2020-02-02" }
    association :user
  end
end
