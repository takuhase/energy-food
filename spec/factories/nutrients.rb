FactoryBot.define do
  factory :meat, class: "Nutrient" do
    name { "Meat" }
    addon_price { 3 }
    alacarte_price { 5 }
  end

  factory :vegetable, class: "Nutrient" do
    name { "Vegetable" }
    addon_price { 2 }
    alacarte_price { 3 }
  end
end
