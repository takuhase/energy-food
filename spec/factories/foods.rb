FactoryBot.define do
  factory :food do
    id { 1 }
    chinese_name { "蜜汁鸡丁" }
    english_name { "HK Honey Sesame Chicken Cubes" }
    food_category_id { 1 }
    association :food_category
  end

  factory :other_food, class: "Food" do
    id { 2 }
    chinese_name { "姜蓉蒸鸡" }
    english_name { "Ginger Steamed Chicken" }
    food_category_id { 1 }
    association :food_category
  end
end
