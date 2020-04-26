require 'rails_helper'

RSpec.feature "Orders", type: :feature do
  let!(:test_user) { FactoryBot.create(:user) }
  let!(:daily_food_1) { FactoryBot.create(:food_date_relation_1) }
  let!(:daily_food_2) { FactoryBot.create(:food_date_relation_2) }
  let!(:daily_food_3) { FactoryBot.create(:food_date_relation_3) }
  let!(:daily_food_4) { FactoryBot.create(:food_date_relation_4) }

  scenario "Create Order correctly" do
    login_as test_user, scope: :user
    visit user_path(test_user)
    expect(current_path).to eq "/users/#{test_user.id}"

    expect do
      expect(page).to have_content "明日のメニュー"
      expect(page).to have_content "注文履歴"

      within(".select-menu-#{daily_food_1.id}") do
        expect(page).to have_content "蜜汁鸡丁"
        check "daily_food_ids[]"
      end
      within(".select-menu-#{daily_food_2.id}") do
        expect(page).to have_content "姜蓉蒸鸡"
      end
      within(".select-menu-#{daily_food_4.id}") do
        expect(page).to have_content "蒸西兰花"
        check "daily_food_ids[]"
      end
      click_button "注文を送信"
    end.to change(Order, :count).by(1)
  end
end
