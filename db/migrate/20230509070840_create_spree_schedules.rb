class CreateSpreeSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_schedules do |t|
      t.integer :day_code
      t.string :day
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :closed
      t.datetime :deleted_at
      t.index :deleted_at      
    end
  end
end
