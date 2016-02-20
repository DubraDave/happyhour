class Event < ActiveRecord::Base
  validates :description, :day, :beginning, :end, :restaurant_id, presence: true

  validates_time :end, :on_or_after => :beginning,
            		   :on_or_after_message => 'of the event must take place sometime after the beginning!'

  belongs_to :restaurant, dependent: :destroy
  has_many :followers, class_name: "EventRelationship", 
					   foreign_key: "followed_event_id", 
					   dependent: :destroy

end
