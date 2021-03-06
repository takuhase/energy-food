class ShopClerks::FoodsController < ApplicationController
  before_action :authenticate_shop_clerk!
  PER = 10

  def index
    @foods = Food.descending_order.paginate(page: params[:page], per_page: PER)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to shop_clerks_foods_path, notice: "料理を追加しました。"
    else
      redirect_to new_shop_clerks_food_path, alert: '全ての項目を入力して下さい。'
    end
  end

  private

  def food_params
    params.require(:food).permit(
      :chinese_name, :english_name, :food_category_id
    )
  end
end
