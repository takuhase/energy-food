class HomesController < ApplicationController
  def index
    # メソッド化する
    tomorrow = "2019-12-16"
    @tomorrow_menu_list = DailyFood.where(date: tomorrow)
    @tomorrow_foods = @tomorrow_menu_list.map do |tomorrow_menu|
      tomorrow_menu.food
    end
    # @todays_foods = DailyFood.where(date: "2019-12-16")
    # order_details = Order_details.where()
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
