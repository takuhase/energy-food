FactoryBot.define do
  factory :food_category do
    name { "Chicken" }
    nutrient_id { 1 }
    association :nutrient
  end

  factory :other_food_category, class: "FoodCategory" do
    name { "Pork" }
    nutrient_id { 1 }
    association :nutrient
  end
end
