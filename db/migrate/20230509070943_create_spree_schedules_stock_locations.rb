class CreateSpreeSchedulesStockLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_schedules_stock_locations do |t|
      t.bigint :schedule_id
      t.bigint :stock_location_id

      t.timestamps
    end
  end
end
