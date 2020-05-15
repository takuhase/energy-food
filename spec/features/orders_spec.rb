require 'rails_helper'

RSpec.feature "Orders", type: :feature do
  let!(:daily_food_1) { FactoryBot.create(:food_date_relation_1) }
  let!(:daily_food_2) { FactoryBot.create(:food_date_relation_2) }
  let!(:daily_food_3) { FactoryBot.create(:food_date_relation_3) }
  let!(:daily_food_4) { FactoryBot.create(:food_date_relation_4) }
  let!(:test_user) { FactoryBot.create(:user) }

  scenario "Create, update and delete order successfully" do
    login_as test_user, scope: :user
    visit root_path
    expect(current_path).to eq "/"

    # Create order
    expect do
      expect(page).to have_content "明日のメニュー"
      within(".select-menu-#{daily_food_1.id}") do
        expect(page).to have_content "蜜汁鸡丁"
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

    # Update order
    visit user_path(test_user)
    expect(current_path).to eq "/users/#{test_user.id}"

    within(".order-history") do
      expect(page).not_to have_content "蜜汁鸡丁"
      expect(page).not_to have_content "姜蓉蒸鸡"
      expect(page).to have_content "蒸西兰花"
      expect do
        find('.button-like').click
      end.to change(Like, :count).by(1)
      expect do
        find('.button-like').click
      end.to change(Like, :count).by(-1)

      click_link "Edit"
    end
    within(".select-menu-#{daily_food_1.id}") do
      expect(page).to have_content "蜜汁鸡丁"
      check "daily_food_ids[]"
    end
    within(".select-menu-#{daily_food_2.id}") do
      expect(page).to have_content "姜蓉蒸鸡"
    end
    within(".select-menu-#{daily_food_4.id}") do
      expect(page).to have_content "蒸西兰花"
      uncheck "daily_food_ids[]"
    end
    click_button "注文を変更"

    # Delete order
    expect do
      within(".order-history") do
        expect(page).to have_content "蜜汁鸡丁"
        expect(page).not_to have_content "姜蓉蒸鸡"
        expect(page).not_to have_content "蒸西兰花"
        click_link "Delete"
      end
    end.to change(Order, :count).by(-1)
  end
end
