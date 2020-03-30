FactoryBot.define do
  factory :nutrient do
    name { "Meat" }
    addon_price { 3 }
    alacarte_price { 5 }
  end

  factory :other_nutrient, class: "Nutrient" do
    name { "Vegetable" }
    addon_price { 2 }
    alacarte_price { 3 }
  end
end
