class AddBoostBudgetToJobs < ActiveRecord::Migration
  def up
    add_column :jobs, :boost_budget, :integer, default: 0, null: false
  end
  def down
  	remove_column :jobs, :boost_budget, :integer
  end
end
