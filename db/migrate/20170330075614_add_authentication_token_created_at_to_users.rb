class AddAuthenticationTokenCreatedAtToUsers < ActiveRecord::Migration
  def up
    add_column :users, :authentication_token_created_at, :datetime
  end

  def down
  	remove_column :users, :authentication_token_created_at
  end
end
