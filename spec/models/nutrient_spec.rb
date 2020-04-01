require 'rails_helper'

RSpec.describe Nutrient, type: :model do
  # Exceptional scenarios
  # it "is invalid without name" do
  #   expect(FactoryBot.build(:nutrient, name: nil)).not_to be_valid
  # end
  #
  # it "is invalid without addon_price" do
  #   expect(FactoryBot.build(:other_nutrient, addon_price: nil)).not_to be_valid
  # end
  #
  # it "is invalid without alacarte_price" do
  #   expect(FactoryBot.build(:other_nutrient, alacarte_price: nil)).not_to be_valid
  # end

  # Normal scenario
  it "is valid with all atributes are given" do
    expect(FactoryBot.build(:meat)).to be_valid
  end

  # Exceptional scenarios
  it "is invalid without name" do
    expect(FactoryBot.build(:meat, name: nil)).not_to be_valid
  end

  it "is invalid without addon_price" do
    expect(FactoryBot.build(:meat, addon_price: nil)).not_to be_valid
  end

  it "is invalid without alacarte_price" do
    expect(FactoryBot.build(:meat, alacarte_price: nil)).not_to be_valid
  end

  it "is invalid with same nutrient name can be exist" do
    FactoryBot.create(:meat)
    meat = FactoryBot.build(:meat)
    expect(meat.save).to be_falsey
  end
end
