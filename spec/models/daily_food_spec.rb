require 'rails_helper'

RSpec.describe DailyFood, type: :model do
  # Normal scenario
  it "is valid if all atributes are given" do
    fdr1 = FactoryBot.build_stubbed(:food_date_relation_1)
    expect(fdr1).to be_valid
  end

  it "is valid more than 1 relations have same date" do
    FactoryBot.create(:food_date_relation_1)
    fdr2 = FactoryBot.build_stubbed(:food_date_relation_2)
    expect(fdr2).to be_valid
  end

  it "is valid more than 1 relations have same food_id" do
    fdr1 = FactoryBot.create(:food_date_relation_1)
    fdr3 = FactoryBot.build_stubbed(:food_date_relation_3, food_id: fdr1.food_id)
    expect(fdr3).to be_valid
  end

  # Exceptional scenarios
  it "is invalid without food_id" do
    fdr1 = FactoryBot.build_stubbed(:food_date_relation_1, food_id: nil)
    expect(fdr1).not_to be_valid
  end

  it "is invalid without date" do
    fdr1 = FactoryBot.build_stubbed(:food_date_relation_1, date: nil)
    expect(fdr1).not_to be_valid
  end

  it "is invalid more than 1 relations has same combination of food_id and date" do
    fdr1 = FactoryBot.create(:food_date_relation_1)
    fdr2 = FactoryBot.build(:food_date_relation_2, food_id: fdr1.food_id)
    expect(fdr2.save).to be_falsey
  end
end
