module Spree
  module Api
    module V1
      module StockLocationsControllerDecorator
        def schedules
          render json: { status: 'ok', schedules: stock_location.schedules.enables.order(:day_code) }
        end
      end
    end
  end
end

::Spree::Api::V1::StockLocationsController.prepend ::Spree::Api::V1::StockLocationsControllerDecorator
