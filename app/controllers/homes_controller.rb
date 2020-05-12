class HomesController < ApplicationController
  include Common

  def index
    tomorrow_date_food_relations = DailyFood.show_menu_list(Date.tomorrow)
    categorize(tomorrow_date_food_relations)
    @order = Order.new
  end

  def new_guest
    user = User.guest_login
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
