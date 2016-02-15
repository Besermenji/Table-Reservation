class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.datetime :visited_date
      t.belongs_to :visitor, index: true, foreign_key: true
      t.belongs_to :visited, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
