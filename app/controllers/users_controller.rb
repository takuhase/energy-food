class UsersController < ApplicationController
  include Common
  before_action :authenticate_user!
  before_action :correct_user, only: [:show]

  def show
    @orders = User.find(params[:id]).orders.order(id: "DESC")
    order_details = return_order_details_from_order(@orders)
    @daily_foods = return_daily_foods_from_order_details(order_details)
    @tomorrow_foods = show_menu_list(Date.tomorrow)
  end

  private

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
