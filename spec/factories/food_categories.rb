FactoryBot.define do
  factory :food_category do
    id { 1 }
    name { "Chicken" }
    nutrient_id { 1 }
    association :nutrient
  end

  factory :other_food_category, class: "FoodCategory" do
    id { 2 }
    name { "Pork" }
    nutrient_id { 1 }
    association :nutrient
  end
end
