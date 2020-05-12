module OrdersHelper
  def total_price(per_order)
    per_order.sum do |date_food_relation|
      date_food_relation.alacarte_price
    end
  end
end
