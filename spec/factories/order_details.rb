FactoryBot.define do
  factory :detail_1, class: "OrderDetail" do
    association :daily_food, factory: :food_date_relation_1
    association :order, factory: :order
  end

  factory :detail_2, class: "OrderDetail" do
    association :daily_food, factory: :food_date_relation_2
    association :order, factory: :order
  end
end
