class CreateSalaryRanges < ActiveRecord::Migration
  def up
    create_table :salary_ranges do |t|
      t.string :name

      t.timestamps null: false
    end
  end

  def down
    drop_table :salary_ranges
  end
end
