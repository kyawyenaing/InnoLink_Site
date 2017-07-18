class AddStatusToBoostcampaings < ActiveRecord::Migration
  def up
    add_column :boostcampaings, :status, :integer ,default: 0, null: false
  end

  def down
  	remove_column :boostcampaings, :status, :integer
  end
end
