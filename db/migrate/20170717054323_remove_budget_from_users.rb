class RemoveBudgetFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :budget, :integer
  end
end
