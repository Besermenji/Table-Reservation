class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :token
      t.boolean :accepted
      t.belongs_to :rating, index: true
      t.belongs_to :invited_user, class_name: 'User', index: true

      t.timestamps null: false
    end
  end
end
