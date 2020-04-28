FactoryBot.define do
  factory :chicken, class: "FoodCategory" do
    id { 1 }
    name { "Chicken" }
    association :nutrient, factory: :meat

    initialize_with do
      FoodCategory.find_or_initialize_by(
        id: 1,
        name: "Chicken"
      )
    end

  end

  factory :pork, class: "FoodCategory" do
    name { "Pork" }
    association :nutrient, factory: :meat

    initialize_with do
      FoodCategory.find_or_initialize_by(
        id: 2,
        name: "Pork"
      )
    end
  end

  factory :vege, class: "FoodCategory" do
    name { "Vege" }
    association :nutrient, factory: :vegetable

    initialize_with do
      FoodCategory.find_or_initialize_by(
        id: 5,
        name: "Vege"
      )
    end
  end
end
