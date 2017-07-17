class AddBudgetToUsers < ActiveRecord::Migration
  def up
    add_column :users, :budget, :integer,default: 0, null: false
  end

  def down
  	remove_column :users, :budget, :integer
  end
end
