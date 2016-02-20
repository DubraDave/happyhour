class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :restaurant_follows, class_name: "RestaurantRelationship", 
  									  foreign_key: "follower_id", 
  									  dependent: :destroy
  has_many :event_follows, class_name: "EventRelationship", 
  									  foreign_key: "follower_id", 
  									  dependent: :destroy
  
  has_many :restaurants, through: :restaurant_follows, source: :followed_restaurant
  has_many :events, through: :event_follows, source: :followed_event
  
  def follow_restaurant(target)
    restaurant_follows.create(followed_restaurant_id: target)
  end

  def unfollow_restaurant(target)
    restaurant_follows.find_by(followed_restaurant_id: target).destroy
  end

  def following_restaurant?(target)
    restaurants.include?(target)
  end

  def follow_event(target)
    event_follows.create(followed_event_id: target)
  end

  def unfollow_event(target)
    event_follows.find_by(followed_event_id: target).destroy
  end

  def following_event?(target)
    events.include?(target)
  end

  def current_user?(user)
    user == current_user
  end

  def event_feed
    #Need to work out the datetime issue before I can order these properly (most immediate first)
    events.order('day ASC')
  end

  def restaurant_feed
    #Need to think about how I order this - Preferably by distance
    restaurants
  end
end
