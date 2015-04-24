class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :neighbourhood
      t.string :price_range
      t.text :summary
      t.string :menu
      t.string :category

      t.timestamps null: false
    end
  end
end
