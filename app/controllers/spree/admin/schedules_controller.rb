module Spree
  module Admin
    class SchedulesController < ResourceController
      before_action :set_stock_locations

      def index
        @search = Spree::Schedule.ransack(search_params)
        @schedules = @search.result.page(params[:page]).per(params[:per_page])
      end

      private

      def search_params
        #params.require(:q).permit(:stock_locations_id_eq, :name_cont, :commit)
      end

      def set_stock_locations
        @stock_locations = Spree::StockLocation.active
      end
    end
  end
end
