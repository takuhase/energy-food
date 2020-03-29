require 'rails_helper'

RSpec.describe User, type: :model do
  # No need to test attributes except name as they are created by Devise.
  # Normal scenario
  it "is valid with name of 50 or less characters" do
    expect(FactoryBot.build(:user, name: "a" * 50)).to be_valid
  end

  # Exceptional scenarios
  it "is invalid without name" do
    expect(FactoryBot.build(:user, name: nil)).not_to be_valid
  end

  it "is invalid with long name of 51 or more characters" do
    expect(FactoryBot.build(:user, name: "a" * 51)).not_to be_valid
  end
end
