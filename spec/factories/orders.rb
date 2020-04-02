FactoryBot.define do
  factory :order do
    association :user
  end

  factory :other_order, class: "Order" do
    association :user
  end
end
