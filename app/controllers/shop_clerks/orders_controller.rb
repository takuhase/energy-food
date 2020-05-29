class ShopClerks::OrdersController < ApplicationController
  before_action :authenticate_shop_clerk!

  def show
    order_id = params[:id]
    daily_foods = Order.get_daily_foods(order_id)
    @foods = daily_foods.map(&:food)
    @total_price = @foods.sum(&:alacarte_price)
    user = User.find(Order.find(order_id).user_id)

    respond_to do |format|
      format.html do
      end
      format.csv do
        send_data render_to_string, filename: "#{order_id}-#{user.name}-#{Time.now.to_date}.csv",
                                    type: :csv
      end
    end
  end
end
