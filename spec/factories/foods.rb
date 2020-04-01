FactoryBot.define do
  factory :chicken_meal_1, class: "Food" do
    chinese_name { "蜜汁鸡丁" }
    english_name { "HK Honey Sesame Chicken Cubes" }
    association :food_category, factory: :chicken
  end

  factory :chicken_meal_2, class: "Food" do
    chinese_name { "姜蓉蒸鸡" }
    english_name { "Ginger Steamed Chicken" }
    association :food_category, factory: :chicken
  end
end
