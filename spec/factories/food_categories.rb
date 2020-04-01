FactoryBot.define do
  factory :chicken, class: "FoodCategory" do
    name { "Chicken" }
    association :nutrient, factory: :meat
  end

  factory :pork, class: "FoodCategory" do
    name { "Pork" }
    association :nutrient, factory: :meat
  end
end
