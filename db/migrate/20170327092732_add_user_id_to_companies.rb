class AddUserIdToCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :user_id, :integer
  end

  def down
  	remove_column :companies, :user_id
  end
end
