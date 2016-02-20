class EventRelationshipsController < ApplicationController
	before_action :authenticate_user!

  def create
    @user = User.find(params[:follower_id])
    current_user.follow_event(params[:followed_event_id])
    respond_to do |format|
      format.html { redirect_to Event.find(params[:followed_event_id]) }
      format.js
  	end
  end

  def destroy
    current_user.unfollow_event(params[:followed_event_id])
    respond_to do |format|
      format.html { redirect_to Event.find(params[:followed_event_id])}
      format.js
  	end
  end
end