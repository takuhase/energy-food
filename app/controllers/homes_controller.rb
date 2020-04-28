class HomesController < ApplicationController
  def index
    tomorrow_date_food_relations = DailyFood.show_menu_list
    @categorized = {
      "Chicken" => [],
      "Pork" => [],
      "Fish" => [],
      "Tofu / Egg" => [],
      "Vegetables" => [],
      "special Items" => [],
    }
    tomorrow_date_food_relations.each do |date_food_relation|
      food_categories = {
        1 => "Chicken",
        2 => "Pork",
        3 => "Fish",
        4 => "Tofu / Egg",
        5 => "Vegetables",
        6 => "special Items",
      }
      id = food_categories[date_food_relation.food.food_category_id]
      @categorized[id].push(date_food_relation)
    end
    @order = Order.new
  end

  def new_guest
    user = User.guest_login
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
