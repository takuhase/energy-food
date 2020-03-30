require 'rails_helper'

RSpec.describe Food, type: :model do
  # Normal scenario
  it "is valid with foreign key food_category_id" do
    food = FactoryBot.build(:food)
    expect(food).to be_valid
  end

  it "is valid that more than 1 foods belong to a food_category" do
    food_1 = FactoryBot.create(:food)
    food_2 = FactoryBot.build(:other_food, food_category_id: food_1.food_category_id)
    expect(food_2.save).to be_truthy
  end

  # Exceptional scenarios
  it "is invalid without Chinese name" do
    expect(FactoryBot.build(:food, chinese_name: nil)).not_to be_valid
  end

  it "is invalid without English name" do
    expect(FactoryBot.build(:food, english_name: nil)).not_to be_valid
  end

  it "is invalid without foreign key food_category_id" do
    food = FactoryBot.build(:food, food_category_id: nil)
    expect(food).not_to be_valid
  end
end
