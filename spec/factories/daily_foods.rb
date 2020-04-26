FactoryBot.define do
  factory :food_date_relation_1, class: "DailyFood" do
    date { Date.tomorrow }
    association :food, factory: :chicken_meal_1
  end

  factory :food_date_relation_2, class: "DailyFood" do
    date { Date.tomorrow }
    association :food, factory: :chicken_meal_2
  end

  factory :food_date_relation_3, class: "DailyFood" do
    date { Date.today }
    association :food, factory: :chicken_meal_1
  end

  factory :food_date_relation_4, class: "DailyFood" do
    date { Date.tomorrow }
    association :food, factory: :vege_meal_1
  end
end
