class AddCampaingIdToBoosts < ActiveRecord::Migration
  def up
    add_column :boosts, :campaing_id, :integer
  end

  def down
  	remove_column :boosts, :campaing_id, :integer
  end
end
