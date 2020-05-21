require 'rails_helper'

RSpec.feature "DailyFoods", type: :feature do
  let(:shop_clerk) { create(:shop_clerk) }
  let!(:daily_food_1) { create(:food_date_relation_1) }
  let!(:daily_food_2) { create(:food_date_relation_2) }

  before do
    login_as shop_clerk, scope: :shop_clerk
  end

  scenario "Show DailyFood list by shop clerk" do
    visit shop_clerks_daily_foods_path
    expect(current_path).to eq "/shop_clerks/daily_foods"
    expect(page).to have_content "日替わりメニューID"
    expect(page).to have_content "HK Honey Sesame Chicken Cubes"
    expect(page).to have_content "Ginger Steamed Chicken"
    click_link "add-daily-food-link"
    expect(current_path).to eq "/shop_clerks/daily_foods/new"
  end

  scenario "Add DailyFood by shop clerk" do
    visit new_shop_clerks_daily_food_path
    expect(current_path).to eq "/shop_clerks/daily_foods/new"
    expect do
      select '2020', from: 'daily_food[date(1i)]'
      select '5月', from: 'daily_food[date(2i)]'
      select '10', from: 'daily_food[date(3i)]'
      select daily_food_1.english_name, from: 'daily_food[food_id]'
      click_button "追加"
    end.to change(DailyFood, :count).by(1)

    expect(page).to have_current_path "/shop_clerks/daily_foods"
    expect(page).to have_content "日替わりメニューを追加しました。"
  end
end
