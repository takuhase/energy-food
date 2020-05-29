require 'rails_helper'

RSpec.feature "SignOuts", type: :feature do
  let(:user) { create(:user) }
  let(:shop_clerk) { create(:shop_clerk) }
  let(:admin_user) { create(:admin_user) }

  scenario "User can sign out from his own page" do
    login_as user, scope: :user
    visit root_path
    click_link "ログアウト"
    expect(page).to have_content "ログアウトしました。"
    expect(current_path).to eq "/"
  end

  scenario "Shop Clerk can sign out from his own page" do
    login_as shop_clerk, scope: :shop_clerk
    visit shop_clerks_root_path
    click_link "ログアウト"
    expect(page).to have_content "ログアウトしました。"
    expect(current_path).to eq "/"
  end

  scenario "Admin can sign out from his own page" do
    login_as admin_user, scope: :admin_user
    visit admin_root_path
    click_link "ログアウト"
    expect(page).to have_content "新規登録もしくはログインしてください。"
    expect(current_path).to eq "/admin/login"
  end
end
