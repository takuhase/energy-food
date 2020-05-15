class UsersController < ApplicationController
  include Common
  before_action :authenticate_user!
  before_action :correct_user, only: [:show]

  def show
    @orders = orders = Order.get_orders(params[:id])
    @ordered_foods_history = orders.map do |order|
      order.order_details.map do |detail|
        detail.daily_food
      end
    end
  end
end
