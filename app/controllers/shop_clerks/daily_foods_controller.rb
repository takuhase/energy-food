class ShopClerks::DailyFoodsController < ApplicationController
  before_action :authenticate_shop_clerk!
  PER = 10

  def index
    @daily_foods = DailyFood.descending_order.paginate(page: params[:page], per_page: PER)
  end

  def new
    @daily_food = DailyFood.new
  end

  def create
    @daily_food = DailyFood.new(daily_food_params)
    return redirect_to shop_clerks_daily_foods_path, notice: "日替わりメニューを追加しました。" if @daily_food.save
    if params[:daily_food][:food_id].empty?
      flash.now[:alert] = '料理名を選択して下さい。'
      return render 'new'
    else
      flash.now[:alert] = '日付と料理名の組み合わせが既に存在しています。'
      render 'new'
    end
  end

  private

  def daily_food_params
    params.require(:daily_food).permit(
      :date, :food_id
    )
  end
end
