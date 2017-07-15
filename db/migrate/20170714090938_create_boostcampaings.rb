class CreateBoostcampaings < ActiveRecord::Migration
  def up
    create_table :boostcampaings do |t|
      t.integer :job_id
      t.date :start_date
      t.date :end_date
      t.integer :total_budget

      t.timestamps null: false
    end
  end

  def down
  	drop_table :boostcampaings
  end
end
