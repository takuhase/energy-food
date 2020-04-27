class HomesController < ApplicationController
  def index
    @tomorrow_date_food_relations = DailyFood.show_menu_list
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
