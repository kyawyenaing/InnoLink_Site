class CreateCompanies < ActiveRecord::Migration
  def up
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.integer :category_id
      t.integer :city_id
      t.text :address
      t.text :about

      t.timestamps null: false
    end
  end

  def down
    drop_table :companies
  end
end
