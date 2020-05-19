require 'rails_helper'

RSpec.describe ShopClerk, type: :model do
  # Normal scenario
  it "is valid with correct info to save" do
    expect(FactoryBot.create(:shop_clerk)).to be_valid
  end

  # Exceptional scenarios
  it "is invalid without email" do
    expect(FactoryBot.build(:shop_clerk, email: nil)).not_to be_valid
  end

  it "is invalid without password" do
    expect(FactoryBot.build(:shop_clerk, password: nil)).not_to be_valid
  end
end
