class ShopClerks::HomesController < ApplicationController
  PER = 10
  def index
    daily_foods = DailyFood.show_menu_list(Date.tomorrow)
    details_arr = daily_foods.map { |daily_food| OrderDetail.specific_date(daily_food) }
    details_arr.flatten!
    order_ids = details_arr.pluck(:order_id).uniq
    @orders = order_ids.map { |order_id| Order.find(order_id) }

    grouped_details = details_arr.group_by { |detail| detail.order_id }
    @ordered_foods_history = grouped_details.map do |k, v|
      v.map { |detail| DailyFood.find(detail.daily_food_id) }
    end
  end
end
