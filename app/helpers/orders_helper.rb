module OrdersHelper
  def total_price(per_order)
    per_order.sum(&:alacarte_price)
  end
end
