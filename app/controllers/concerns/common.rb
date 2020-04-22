module Common
  extend ActiveSupport::Concern

  def show_menu_list(date)
    @date_menu_list = DailyFood.where(date: date)
    # @tomorrow_foods = @date_menu_list.map do |date_menu|
    #   date_menu.food
    # end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url, alert: '他ユーザーの情報は閲覧できません') unless current_user == @user
  end
end
