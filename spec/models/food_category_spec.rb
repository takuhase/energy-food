require 'rails_helper'

RSpec.describe FoodCategory, type: :model do
  # Normal scenario
  it "is valid with foreign key nutrient_id" do
    expect(FactoryBot.build(:food_category)).to be_valid
  end

  it "is valid that more than 1 food_categories belong to a nutrient" do
    categ_1 = FactoryBot.create(:food_category)
    categ_2 = FactoryBot.build(:other_food_category, nutrient_id: categ_1.nutrient_id)
    expect(categ_2.save).to be_truthy
  end

  # Exceptional scenarios
  it "is invalid without name" do
    expect(FactoryBot.build(:food_category, name: nil)).not_to be_valid
  end

  it "is invalid without foreign key nutrient_id" do
    food_category = FactoryBot.build(:food_category, nutrient_id: nil)
    expect(food_category).not_to be_valid
  end
end
