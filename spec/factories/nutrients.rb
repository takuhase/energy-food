FactoryBot.define do
  factory :nutrient do
    id { 1 }
    name { "Meat" }
    addon_price { 3 }
    alacarte_price { 5 }
  end

  factory :other_nutrient, class: "Nutrient" do
    id { 2 }
    name { "Vegetable" }
    addon_price { 2 }
    alacarte_price { 3 }
  end
end
