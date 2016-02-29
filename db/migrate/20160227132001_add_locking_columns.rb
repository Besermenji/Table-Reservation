class AddLockingColumns < ActiveRecord::Migration
  def self.up 
    add_column :restaurants, :lock_version, :integer, :default => 0, :null => false
    add_column :meals, :lock_version, :integer, :default => 0, :null => false
    add_column :tables, :lock_version, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :restaurants, :lock_version
    remove_column :meals, :lock_version
    remove_column :tables, :lock_version
  end
end
