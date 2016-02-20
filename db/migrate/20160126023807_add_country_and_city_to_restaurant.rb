class AddCountryAndCityToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :country, :string
    add_column :restaurants, :city, :string
  end
end
