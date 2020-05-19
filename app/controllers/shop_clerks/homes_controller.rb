class ShopClerks::HomesController < ApplicationController
  PER = 10
  def index
    @foods = Food.all.order(likes_count: "DESC").paginate(page: params[:page], per_page: PER)
  end
end
