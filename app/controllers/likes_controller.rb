class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @food = Food.find(params[:food_id])
    unless @food.fav?(current_user)
      @food.fav(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @food = Like.find(params[:id]).food
    if @food.fav?(current_user)
      @food.unfav(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
