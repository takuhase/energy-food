class HomesController < ApplicationController
  include Common

  def index
    if user_signed_in?
      tomorrow_date_food_relations = DailyFood.show_menu_list(Date.tomorrow)
      categorize(tomorrow_date_food_relations)
      @order = Order.new
    end
  end

  def new_guest
    user = User.guest_login
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def new_guest_clerk
    shop_clerk = ShopClerk.guest_login
    sign_in shop_clerk
    redirect_to shop_clerks_root_path, notice: 'ゲスト店員としてログインしました。'
  end
end
