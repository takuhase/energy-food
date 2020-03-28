require 'rails_helper'

RSpec.describe User, type: :model do
  # No need to test attributes except name as they are created by Devise.
  it "is invalid without name" do
    user = User.new(name: nil,
                    email: "example@energy-food.com",
                    password: "password",
                    password_confirmation: "password")
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "is invalid with long name" do
    user = User.new(name: "a" * 51,
                    email: "example@energy-food.com",
                    password: "password",
                    password_confirmation: "password")
    user.valid?
    expect(user.errors[:name]).to include("は50文字以内で入力してください")
  end
end
