require 'rails_helper'

RSpec.feature "Homes", type: :feature do
  let!(:test_user) { FactoryBot.create(:user) }

  scenario "Root page shows message when no foods are prepared for tomorrow" do
    login_as test_user, scope: :user
    visit root_path
    expect(page).to have_content "明日はお休みです。"
  end

  scenario "Root page shows food when it is prepared for tomorrow" do
    FactoryBot.create(:food_date_relation_1)
    login_as test_user, scope: :user
    visit root_path
    expect(page).to have_content "蜜汁鸡丁"
  end
end
