class RemoveBudgetFromUsers < ActiveRecord::Migration
  def down
    remove_column :users, :budget, :integer
  end
end
