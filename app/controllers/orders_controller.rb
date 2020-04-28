class OrdersController < ApplicationController
  include Common
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]

  def create
    ids = params[:daily_food_ids]
    return redirect_to root_path, alert: 'メニューを選択して下さい。' if ids.nil?
    @order = Order.new(user_id: current_user.id)
    Order.transaction do
      @order.save!
      OrderDetail.transaction do
        ids.each do |id|
          OrderDetail.create!(order_id: @order.id, daily_food_id: id.to_i)
        end
      end
    end
    redirect_to request.referrer, notice: '注文を受け付けました。'
  end

  def edit
    @order = Order.find(params[:id])
    order_details = OrderDetail.where(order_id: @order.id)
    @daily_foods = return_daily_foods_from_order_details(order_details)

    date = @daily_foods.first.date
    @tomorrow_date_food_relations = DailyFood.show_menu_list(date)
    @food_arr = @daily_foods.map do |food|
      food.id
    end
  end

  def update
    ids = params[:daily_food_ids]
    return redirect_to request.referrer, alert: 'メニューを選択して下さい。' if ids.nil?
    order = Order.find(params[:id])

    Order.transaction do
      order.order_details.destroy_all
      OrderDetail.transaction do
        ids.each do |id|
          OrderDetail.create!(order_id: order.id, daily_food_id: id.to_i)
        end
      end
    end
    redirect_to current_user, notice: '注文を変更しました。'
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to request.referrer, notice: '注文を取り消しました。'
  end

  private

  def correct_user
    @user = Order.find(params[:id]).user
    redirect_to(root_url, alert: '他ユーザーの情報は閲覧できません') unless current_user == @user
  end

  def return_daily_foods_from_order_details(order_details)
    order_details.map do |order_detail|
      DailyFood.find(order_detail.daily_food_id)
    end
  end
end
