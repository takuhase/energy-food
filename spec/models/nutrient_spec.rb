require 'rails_helper'

RSpec.describe Nutrient, type: :model do
  # Exceptional scenarios
  it "is invalid without name" do
    expect(FactoryBot.build(:nutrient, name: nil)).not_to be_valid
  end

  it "is invalid without addon_price" do
    expect(FactoryBot.build(:other_nutrient, addon_price: nil)).not_to be_valid
  end

  it "is invalid without alacarte_price" do
    expect(FactoryBot.build(:other_nutrient, alacarte_price: nil)).not_to be_valid
  end
end
