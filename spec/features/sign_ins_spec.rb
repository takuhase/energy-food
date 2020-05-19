require 'rails_helper'

RSpec.feature "SignIns", type: :feature do
  let(:user) { create(:user) }
  let(:shop_clerk) { create(:shop_clerk) }

  scenario "Use can sign in successfully" do
    visit new_user_session_path
    click_link "ログイン"
    expect(page).to have_content "ログイン"
    fill_in "session-email", with: user.email
    fill_in "session-password", with: user.password
    click_button "ログイン"
    expect(page).to have_content "ログインしました。"
    expect(page).to have_current_path "/"
    expect(page).to have_content "明日のメニュー"
  end

  scenario "Store Clerk can sign in successfully" do
    visit new_shop_clerk_session_path
    fill_in "shop_clerk[email]", with: shop_clerk.email
    fill_in "shop_clerk[password]", with: shop_clerk.password
    click_button "Log in"
    expect(page).to have_content "ログインしました。"
    expect(page).to have_current_path "/shop_clerks"
    expect(page).to have_content "Food list"
  end
end