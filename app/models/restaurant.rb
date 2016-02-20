class Restaurant < ActiveRecord::Base
	validates :name, :address1, presence: true

	has_many :events
	has_many :followers, class_name: "RestaurantRelationship", 
  									  foreign_key: "followed_restaurant_id", 
  									  dependent: :destroy

  	geocoded_by :address
  	after_validation :geocode, :if => :address_changed?
  	after_validation :reverse_geocode


  	def address
  		[name, address1, state, zip].compact.join(', ')
	end

	def address_changed?
  		attrs = %w(name address1 state zip)
  		attrs.any?{|a| send "#{a}_changed?"}
	end

	reverse_geocoded_by :latitude, :longitude do |obj,results|
	  if geo = results.first
	  	obj.address1 	= geo.address
	    obj.city    	= geo.city
	    obj.state 		= geo.state
	    obj.zip 		= geo.postal_code
	    obj.country 	= geo.country_code
	  end
	end
	
end
