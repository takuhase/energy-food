class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.new(user_id: current_user.id)
    ids = params[:daily_food_ids]

    return redirect_to root_path, alert: 'メニューを選択して下さい。' if ids.nil?
    @order.save
    ids.each do |id|
      OrderDetail.create!(order_id: @order.id, daily_food_id: id.to_i)
    end
    redirect_to root_path, notice: '注文を受け付けました。'

  end
end
