module Spree
  module StockLocationDecorator
    def self.prepended(base)
      base.has_many :schedules_stock_locations, class_name: 'Spree::SchedulesStockLocation'
      base.has_many :schedules, through: :schedules_stock_locations, class_name: 'Spree::Schedule'
    end
  end
end

::Spree::StockLocation.prepend Spree::StockLocationDecorator
