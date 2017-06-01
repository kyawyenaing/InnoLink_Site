class AddStatusToJobs < ActiveRecord::Migration
  def up
    add_column :jobs, :status, :integer, default: 0, null: false
  end

  def down
  	remove_column :jobs, :status, :integer
  end
end
