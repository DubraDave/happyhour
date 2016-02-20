class CreateRestaurantRelationships < ActiveRecord::Migration
  def change
    create_table :restaurant_relationships do |t|
      t.integer :followed_restaurant_id
      t.integer :follower_id

      t.timestamps null: false
    end

    add_index :restaurant_relationships, :follower_id
    add_index :restaurant_relationships, :followed_restaurant_id
    add_index :restaurant_relationships, [:follower_id, :followed_restaurant_id], 
    						unique: true, 
    						:name => "follower_and_followed_restaurant_id"
  end
end
