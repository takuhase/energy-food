class UsersController < ApplicationController
  include Common
  before_action :authenticate_user!
  before_action :correct_user, only: [:show]

  def show
    @orders = User.find(params[:id]).orders.order(id: "DESC")
    order_details = return_order_details_from_order(@orders)
    @daily_foods = return_daily_foods_from_order_details(order_details)
    @tomorrow_foods = show_tomorrow_menu_list
  end

  private
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url, alert: '他ユーザーの情報は閲覧できません') unless current_user == @user
  end

  def return_order_details_from_order(orders)
    orders.map do |o|
      OrderDetail.where(order_id: o.id)
    end
  end

  def return_daily_foods_from_order_details(order_details)
    order_details.map do |order_detail|
      order_detail.map do |per_food|
        DailyFood.find(per_food.daily_food_id)
      end
    end
  end
end
