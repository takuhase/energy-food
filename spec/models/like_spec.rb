require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "with validation" do
    # Normal scenario
    it "is valid if all atributes are given" do
      expect(FactoryBot.create(:fav_1)).to be_valid
    end

    # Exceptional scenarios
    it "is invalid without user_id" do
      favorite_1 = FactoryBot.build_stubbed(:fav_1, user_id: nil)
      expect(favorite_1).not_to be_valid
    end
    
    it "is invalid without food_id" do
      favorite_1 = FactoryBot.build_stubbed(:fav_1, food_id: nil)
      expect(favorite_1).not_to be_valid
    end
  end

  describe "with DB" do
    # Exceptional scenario
    it "is invalid a user put Like to the same food twice" do
      expect do
        favorite_1 = FactoryBot.create(:fav_1)
        favorite_2 = FactoryBot.build(:fav_1, user_id: favorite_1.user_id, food_id: favorite_1.food_id)
        favorite_2.save!
      end.to raise_error( ActiveRecord::RecordNotUnique )
    end
  end
end
