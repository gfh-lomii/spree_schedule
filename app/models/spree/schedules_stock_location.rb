module Spree
  class SchedulesStockLocation < Spree::Base
    belongs_to :schedule, class_name: 'Spree::Schedule'
    belongs_to :stock_location, class_name: 'Spree::StockLocation'

    validates :schedule, :stock_location, presence: true
  end
end
