require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  # Normal scenario
  it "is valid with correct info to save" do
    expect(FactoryBot.create(:admin_user)).to be_valid
  end

  # Exceptional scenarios
  it "is invalid without email" do
    expect(FactoryBot.build(:admin_user, email: nil)).not_to be_valid
  end

  it "is invalid without password" do
    expect(FactoryBot.build(:admin_user, password: nil)).not_to be_valid
  end
end
