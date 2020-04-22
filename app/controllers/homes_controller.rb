class HomesController < ApplicationController
  include Common
  def index
    tomorrow = Date.tomorrow
    @tomorrow_foods = show_menu_list(tomorrow)
    @order = Order.new
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |u|
      u.name = 'Guest User'
      u.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
