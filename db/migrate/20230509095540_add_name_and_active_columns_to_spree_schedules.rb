class AddNameAndActiveColumnsToSpreeSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_schedules, :name, :string
    add_column :spree_schedules, :active, :boolean, default: true
  end
end
