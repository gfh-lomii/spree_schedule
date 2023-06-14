module Spree
  module Admin
    class SchedulesController < ResourceController
      before_action :set_search_stock_locations, only: %i[index]
      before_action :set_stock_locations

      private

      def collection
        params[:q] = {} if params[:q].blank?
        schedules = super
        @search = schedules.ransack(params[:q])
        @collection = @search.result.page(params[:page]).per(params[:per_page])
      end

      def set_stock_locations
        @stock_locations = Spree::StockLocation.active
      end

      def set_search_stock_locations
        @search_stock_locations = current_store.stock_locations.active.map { |stock_location| [stock_location.name, stock_location.id] }
        @search_stock_locations << [Spree.t('all'), 0]
      end
    end
  end
end
