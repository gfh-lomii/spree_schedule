class AddScheduledAtToSpreeShipments < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_shipments, :scheduled_at, :datetime
  end
end
