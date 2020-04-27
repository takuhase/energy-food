class UsersController < ApplicationController
  include Common
  before_action :authenticate_user!
  before_action :correct_user, only: [:show]

  def show
    @orders = orders = User.get_all_orders(params[:id])
    order_detail_list = OrderDetail.get_order_details(orders)
    @ordered_foods_history = DailyFood.get_daily_foods(order_detail_list)
  end
end
