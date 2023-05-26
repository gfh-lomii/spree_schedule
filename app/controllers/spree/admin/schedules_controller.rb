module Spree
  module Admin
    class SchedulesController < ResourceController
      before_action :set_stock_locations

      private

      def find_resource
        Spree::Schedule.find(params[:id])
      end

      def set_stock_locations
        @stock_locations = Spree::StockLocation.active.count
      end
    end
  end
end
