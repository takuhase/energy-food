module Common
  extend ActiveSupport::Concern

  def show_tomorrow_menu_list
    tomorrow = "2019-12-17"
    @tomorrow_menu_list = DailyFood.where(date: tomorrow)
    @tomorrow_foods = @tomorrow_menu_list.map do |tomorrow_menu|
      tomorrow_menu.food
    end
  end
end
