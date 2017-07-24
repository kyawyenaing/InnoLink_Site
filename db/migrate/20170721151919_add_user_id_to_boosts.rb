class AddUserIdToBoosts < ActiveRecord::Migration
  def up
    add_column :boosts, :user_id, :integer
  end

  def down
  	remove_column :boosts, :user_id, :integer
  end
end
