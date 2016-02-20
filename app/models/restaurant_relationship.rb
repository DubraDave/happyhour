class RestaurantRelationship < ActiveRecord::Base
	belongs_to :followed_restaurant, class_name: "Restaurant"
	belongs_to :follower, class_name: "User"
	
	validates :followed_restaurant_id, presence: true
  	validates :follower_id, presence: true
end
