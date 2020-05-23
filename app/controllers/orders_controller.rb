class OrdersController < ApplicationController
  include Common
  before_action :authenticate_user!
  before_action :correct_order, only: [:show, :edit, :update, :destroy]

  def show
    # @order = Order.find(params[:id])
    daily_foods = Order.get_daily_foods(params[:id])
    @foods = daily_foods.map { |daily_food| daily_food.food }

    @total_price = @foods.sum do |food|
      food.alacarte_price
    end

    respond_to do |format|
      format.html do
      end
      format.csv do
        send_data render_to_string, filename: "order-#{Time.now.to_date}.csv", type: :csv
      end
    end
  end

  def create
    ids = params[:daily_food_ids]
    return redirect_to root_path, alert: 'メニューを選択して下さい。' if ids.nil?
    @order = Order.new(user_id: current_user.id)
    Order.transaction do
      @order.save!
      OrderDetail.transaction do
        ids.each { |id| OrderDetail.create!(order_id: @order.id, daily_food_id: id.to_i) }
      end
    end
    redirect_to order_path(@order), notice: '以下の注文を受け付けました。'
  end

  def edit
    daily_foods = Order.get_daily_foods(params[:id])
    date = daily_foods.first.date

    @food_arr = daily_foods.map { |food| food.id }
    specific_date_food_relations = DailyFood.show_menu_list(date)
    categorize(specific_date_food_relations)
  end

  def update
    ids = params[:daily_food_ids]
    return redirect_to request.referrer, alert: 'メニューを選択して下さい。' if ids.nil?
    order = Order.find(params[:id])

    Order.transaction do
      order.order_details.destroy_all
      OrderDetail.transaction do
        ids.each { |id| OrderDetail.create!(order_id: order.id, daily_food_id: id.to_i) }
      end
      order.touch
    end
    redirect_to current_user, notice: '注文を変更しました。'
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to request.referrer, notice: '注文を取り消しました。'
  end

  private

  def correct_order
    user = Order.find(params[:id]).user
    redirect_to(root_url, alert: '他ユーザーの情報は閲覧できません') unless current_user == user
  end
end
