require 'rails_helper'

RSpec.feature "SignIns", type: :feature do
  let(:user) { create(:user) }

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
end
