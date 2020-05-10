class LikesController < ApplicationController
  # before_action :logged_in_user
  before_action :authenticate_user!

  def create
    # @food = Food.find(params[:food_id])
    # @food.fav(current_user)

    # binding.pry
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
    # @food = Like.find(params[:id]).food
    # @food.unfav(current_user)
    # binding.pry
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
