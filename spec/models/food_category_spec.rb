require 'rails_helper'

RSpec.describe FoodCategory, type: :model do
  # Normal scenario
  it "is valid if all atributes are given" do
    expect(FactoryBot.create(:chicken)).to be_valid
  end

  it "is valid that more than 1 food_categories belong to a nutrient" do
    chicken = FactoryBot.create(:chicken)
    pork = FactoryBot.build(:pork, nutrient_id: chicken.nutrient_id)
    expect(pork.save).to be_truthy
  end

  # Exceptional scenarios
  it "is invalid without name" do
    expect(FactoryBot.build(:chicken, name: nil)).not_to be_valid
  end

  it "is invalid without foreign key nutrient_id" do
    chicken = FactoryBot.build(:chicken, nutrient_id: nil)
    expect(chicken).not_to be_valid
  end
end
