module Common
  extend ActiveSupport::Concern

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url, alert: '他ユーザーの情報は閲覧できません') unless current_user == @user
  end

  def categorize(specific_date_food_relations)
    @categorized = {
      "Chicken" => [],
      "Pork" => [],
      "Fish" => [],
      "Tofu-Egg" => [],
      "Vegetables" => [],
      "SpecialItems" => [],
    }
    specific_date_food_relations.includes(food: { food_category: [:nutrient] }).each do |relation|
      master_categories = {
        1 => "Chicken",
        2 => "Pork",
        3 => "Fish",
        4 => "Tofu-Egg",
        5 => "Vegetables",
        6 => "SpecialItems",
      }
      id = master_categories[relation.food.food_category_id]
      @categorized[id].push(relation)
    end
  end
end
