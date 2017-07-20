class AddUserIdToBoostcampaings < ActiveRecord::Migration
  def up
    add_column :boostcampaings, :user_id, :integer
  end

  def down
  	remove_column :boostcampaings, :user_id, :integer
  end
end
