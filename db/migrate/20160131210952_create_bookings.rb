class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :length
      t.belongs_to :table, index: true, foreign_key: true
      t.belongs_to :user, index:true, forgein_key: true
    end
  end
end
