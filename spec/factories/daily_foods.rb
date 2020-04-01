FactoryBot.define do
  factory :food_date_relation_1, class: "DailyFood" do
    date { "2020-03-31" }
    association :food, factory: :chicken_meal_1
  end

  factory :food_date_relation_2, class: "DailyFood" do
    date { "2020-03-31" }
    association :food, factory: :chicken_meal_2
  end

  factory :food_date_relation_3, class: "DailyFood" do
    date { "2020-03-30" }
    association :food, factory: :chicken_meal_1
  end
end
