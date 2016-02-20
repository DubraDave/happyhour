class CreateEventRelationships < ActiveRecord::Migration
  def change
    create_table :event_relationships do |t|
      t.integer :followed_event_id
      t.integer :follower_id

      t.timestamps null: false
    end

    add_index :event_relationships, :follower_id
    add_index :event_relationships, :followed_event_id
    add_index :event_relationships, [:follower_id, :followed_event_id], unique: true, :name => "follower_and_followed_event_id"
  end
end
