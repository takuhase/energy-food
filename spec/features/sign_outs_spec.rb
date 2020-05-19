require 'rails_helper'

RSpec.feature "SignOuts", type: :feature do
  let(:user) { create(:user) }
  let(:shop_clerk) { create(:shop_clerk) }

  scenario "User can sign out from his own page" do
    login_as user, scope: :user
    visit root_path
    click_link "ログアウト"
    expect(page).to have_content "ログアウトしました。"
    expect(current_path).to eq "/users/sign_in"
    expect(page).to have_content "ログイン"
  end

  scenario "Shop Clerk can sign out from his own page" do
    login_as shop_clerk, scope: :shop_clerk
    visit root_path
    click_link "ログアウト"
    expect(page).to have_content "ログアウトしました。"
    expect(current_path).to eq "/shop_clerks/sign_in"
    expect(page).to have_content "店舗スタッフログイン"
  end
end
