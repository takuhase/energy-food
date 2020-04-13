class OrdersController < ApplicationController
  def create
    @order = Order.new(user_id: current_user.id)
    ids = params[:daily_food_ids]
    if @order.save
      ids.each do |id|
        OrderDetail.create(order_id: @order.id, daily_food_id: id)
      end
    else
      # redirect_to root with alert
    end
  end
end
