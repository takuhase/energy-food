require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  # Normal scenario
  it "is valid without quantity" do
    detail_1 = FactoryBot.build_stubbed(:detail_1)
    expect(detail_1).to be_valid
  end

  it "is valid more than 1 order details belong to the same order, same daily food" do
    detail_1 = FactoryBot.create(:detail_1)
    detail_2 = FactoryBot.build_stubbed(:detail_2, order_id: detail_1.order_id,
                                                   daily_food_id: detail_1.daily_food_id)
    expect(detail_2).to be_valid
  end

  # Exceptional scenarios
  it "is invalid without order_id" do
    detail_1 = FactoryBot.build_stubbed(:detail_1, order_id: nil)
    expect(detail_1).not_to be_valid
  end

  it "is invalid without daily_food_id" do
    detail_1 = FactoryBot.build_stubbed(:detail_1, daily_food_id: nil)
    expect(detail_1).not_to be_valid
  end
end
