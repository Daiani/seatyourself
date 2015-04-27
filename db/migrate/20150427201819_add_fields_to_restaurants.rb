class AddFieldsToRestaurants < ActiveRecord::Migration
  def change
  	add_column(:restaurants, :capacity, :integer)
    add_column(:restaurants, :opening_hour, :integer)
    add_column(:restaurants, :closing_hour, :integer)
  end
end