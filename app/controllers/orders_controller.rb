class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]

  def create
    @order = Order.new(user_id: current_user.id)
    ids = params[:daily_food_ids]

    return redirect_to root_path, alert: 'メニューを選択して下さい。' if ids.nil?
    @order.save
    ids.each do |id|
      OrderDetail.create!(order_id: @order.id, daily_food_id: id.to_i)
    end
    redirect_to request.referrer, notice: '注文を受け付けました。'
  end

  def edit
    @order = Order.find(params[:id])
    order_details = OrderDetail.where(order_id: @order.id)
    @daily_foods = return_daily_foods_from_order_details(order_details)
    # @tomorrow_foods = show_menu_list(Date.tomorrow)

  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to request.referrer, notice: '注文をキャンセルしました。'
  end

  private
  def correct_user
    @user = Order.find(params[:id]).user
    redirect_to(root_url, alert: '他ユーザーの情報は閲覧できません') unless current_user == @user
  end

  # def return_order_details_from_order(order)
  #   OrderDetail.where(order_id: order.id)
  # end

  def return_daily_foods_from_order_details(order_details)
    order_details.map do |order_detail|
      DailyFood.find(order_detail.daily_food_id)
    end
  end
end
