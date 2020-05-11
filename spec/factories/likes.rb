FactoryBot.define do
  factory :fav_1, class: "Like" do
    association :food, factory: :chicken_meal_1
    association :user
  end
end
