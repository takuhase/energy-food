require 'rails_helper'

RSpec.feature "Foods", type: :feature do
  let(:shop_clerk) { create(:shop_clerk) }
  let!(:chicken_meal_1) { create(:chicken_meal_1) }
  let!(:chicken_meal_2) { create(:chicken_meal_2) }

  before do
    login_as shop_clerk, scope: :shop_clerk
  end

  scenario "Show Food list as shop clerk" do
    visit shop_clerks_foods_path
    expect(current_path).to eq "/shop_clerks/foods"
    expect(page).to have_content "料理一覧"
    expect(page).to have_content "蜜汁鸡丁"
    expect(page).to have_content "姜蓉蒸鸡"
    expect(page).not_to have_content "蒸西兰花"
    click_link "add-food-link"
    expect(current_path).to eq "/shop_clerks/foods/new"
  end

  scenario "Add Food as shop clerk" do
    visit new_shop_clerks_food_path
    expect(current_path).to eq "/shop_clerks/foods/new"
    expect do
      fill_in "food[chinese_name]", with: "可乐鸡翅"
      fill_in "food[english_name]", with: "Boiled chicken wings with coke"
      select chicken_meal_1.food_category.name, from: "food[food_category_id]"
      click_button "追加"
    end.to change(Food, :count).by(1)

    expect(page).to have_current_path "/shop_clerks/foods"
    expect(page).to have_content "料理を追加しました。"
    expect(page).to have_content "可乐鸡翅"
  end
end
