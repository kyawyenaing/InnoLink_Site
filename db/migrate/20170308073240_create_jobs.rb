class CreateJobs < ActiveRecord::Migration
  def up
    create_table :jobs do |t|
      t.string :title
      t.string :company_name
      t.string :company_website
      t.integer :job_type, default: 0, null: false
      t.integer :category_id
      t.integer :salary_range_id
      t.integer :city_id
      t.text :description
      t.text :requirement
      t.text :how_to

      t.timestamps null: false
    end
  end

  def down
    drop_table :jobs
  end
end
