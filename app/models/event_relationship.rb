class EventRelationship < ActiveRecord::Base
	belongs_to :followed_event, class_name: "Event"
	belongs_to :follower, class_name: "User"
	
	validates :followed_event_id, presence: true
  	validates :follower_id, presence: true
end
