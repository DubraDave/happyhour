class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.string :day
      t.datetime :beginning
      t.datetime :end
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
