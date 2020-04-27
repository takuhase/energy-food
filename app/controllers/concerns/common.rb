module Common
  extend ActiveSupport::Concern

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url, alert: '他ユーザーの情報は閲覧できません') unless current_user == @user
  end
end
