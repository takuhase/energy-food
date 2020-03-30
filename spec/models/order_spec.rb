require 'rails_helper'

RSpec.describe Order, type: :model do
  # Normal scenario
  it "is valid with foreign key user_id" do
    expect(FactoryBot.build(:order)).to be_valid
  end

  it "is valid that more than 1 order belong to a user" do
    first_order = FactoryBot.create(:order)
    second_order = FactoryBot.build(:order, user_id: first_order.user_id)
    expect(second_order.save).to be_truthy
  end

  # Exceptional scenarios
  it "is invalid without foreign key user_id" do
    order = FactoryBot.build(:order, user_id: nil)
    expect(order).not_to be_valid
  end

  it "is invalid without delivery_date" do
    order = FactoryBot.build(:order, delivery_date: nil)
    expect(order).not_to be_valid
  end
end
