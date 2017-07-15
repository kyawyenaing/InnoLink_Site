class CreateBoosts < ActiveRecord::Migration
  def up
    create_table :boosts do |t|
      t.integer :job_id
      t.date :boosted_date
      t.string :daily_budget

      t.timestamps null: false
    end
  end

  def down
  	drop_table :boosts
  end
end
