class RestaurantRelationshipsController < ApplicationController
	before_action :authenticate_user!

  def create
    @user = User.find(params[:follower_id])
    @restaurant = Restaurant.find(params[:followed_restaurant_id])
    current_user.follow_restaurant(params[:followed_restaurant_id])
    respond_to do |format|
      format.html { redirect_to Restaurant.find(params[:followed_restaurant_id]) }
      format.js
  	end
  end

  def destroy
    @restaurant = Restaurant.find(params[:followed_restaurant_id])
    current_user.unfollow_restaurant(params[:followed_restaurant_id])
    respond_to do |format|
      format.html { redirect_to Restaurant.find(params[:followed_restaurant_id])}
      format.js
  	end
  end
end