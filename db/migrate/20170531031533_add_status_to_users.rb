class AddStatusToUsers < ActiveRecord::Migration
  def up
    add_column :users, :status, :integer, default: 0, null: false
  end

  def down
  	remove_column :users, :status, :integer
  end
end
