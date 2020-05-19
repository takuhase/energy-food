require 'rails_helper'

RSpec.feature "SignOuts", type: :feature do
  before do
    user = create(:user)
    login_as user, scope: :user
  end

  scenario "User can sign out from his own page" do
    visit root_path
    click_link "ログアウト"
    expect(page).to have_content "ログアウトしました。"
    expect(current_path).to eq "/users/sign_in"
    expect(page).to have_content "ログイン"
  end
end
