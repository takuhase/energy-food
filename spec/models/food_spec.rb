require 'rails_helper'

RSpec.describe Food, type: :model do
  # Normal scenario
  it "is valid if all atributes are given" do
    expect(FactoryBot.create(:chicken_meal_1)).to be_valid
  end

  it "is valid that more than 1 foods belong to the same food_category" do
    meal_1 = FactoryBot.create(:chicken_meal_1)
    meal_2 = FactoryBot.build(:chicken_meal_2, food_category_id: meal_1.food_category_id)
    expect(meal_2.save).to be_truthy
  end

  # Exceptional scenarios
  it "is invalid without Chinese name" do
    no_name_meal = FactoryBot.build_stubbed(:chicken_meal_1, chinese_name: nil)
    expect(no_name_meal).not_to be_valid
  end

  it "is invalid without English name" do
    no_name_meal = FactoryBot.build_stubbed(:chicken_meal_1, english_name: nil)
    expect(no_name_meal).not_to be_valid
  end

  it "is invalid without foreign key food_category_id" do
    no_food_categ_meal = FactoryBot.build_stubbed(:chicken_meal_1, food_category_id: nil)
    expect(no_food_categ_meal).not_to be_valid
  end
end
