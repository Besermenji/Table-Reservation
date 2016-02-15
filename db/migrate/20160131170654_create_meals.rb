class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description, precision: 8, scale: 2
      t.decimal :price
      t.belongs_to :restaurant, index: true
      t.timestamps null: false
    end
  end
end
